import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';

import 'level_transition/level_end_transition.dart';
import 'data/board_config.dart';
import 'backdrop/backdrop_paint.dart';
import 'puzzle/puzzle_level.dart';
import 'tutorial/tutorial_dialog.dart';
class puz extends StatefulWidget {
  const puz({Key? key}) : super(key: key);

  @override
  State<puz> createState() => _puz();
}

class _puz extends State<puz> with TickerProviderStateMixin {
  late final _backdropController = BackdropController();

  late final _levelBeginController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  // Controls the level exit animation.
  late final _levelEndController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  int _currentLevel = 0;

  bool _hideTexts = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final unitSize = min(screenSize.width / 6, screenSize.height / 8);
    return Scaffold(
      body: BoardConfig(
        unitSize: unitSize,
        hideTexts: _hideTexts,
        child: Stack(
          children: [
            RepaintBoundary(
              child: BackdropPaint(
                controller: _backdropController,
              ),
            ),
            if (_currentLevel == 0)
              TutorialDialog(
                onDismiss: (bool hideTexts) {
                  setState(() => _hideTexts = hideTexts);
                  _advanceToNextLevel();
                },
              ),
            if (_currentLevel > 0)
              Center(
                child: ScaleTransition(
                  scale: CurveTween(curve: Curves.easeOut)
                      .animate(_levelBeginController),
                  child: LevelEndTransition(
                    animation: _levelEndController,
                    child: PuzzleLevel(
                      // A single level of the puzzle.
                      key: ValueKey(_currentLevel),
                      level: _currentLevel,
                      onWin: _onLevelCompleted,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _advanceToNextLevel() {
    _levelBeginController.forward(from: 0.0);
    setState(() => _currentLevel++);
  }

  void _onLevelCompleted(int level, int steps) async {
    // Make the background colorful.
    _backdropController.celebrate();
    // Play animation: game board falling down and 3D piece spinning.
    await _levelEndController.forward();
    // Take a short break at the empty screen.
    await Future.delayed(const Duration(milliseconds: 300));
    // Reset the animation controller for the next time.
    _levelEndController.reset();
    // Continue on to the next level.
    _advanceToNextLevel();
  }
}