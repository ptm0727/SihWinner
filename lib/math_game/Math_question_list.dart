import 'package:sih_brain_games/math_game/math_question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "12+6",
    {
      "14": false,
      "21": false,
      "17": false,
      "18": true,
    },
  ),
  QuestionModel(
    "18-5",
    {
      "11": false,
      "9": false,
      "13": true,
      "09": false,
    },
  ),
  QuestionModel(
    "8*9",
    {
      "72": true,
      "101": false,
      "78": false,
      "63": false,
    },
  ),
  QuestionModel(
    "45/5",
    {
      "8": false,
      "9": true,
      "13": false,
      "5": false,
    },
  ),
  QuestionModel(
    "45+5+2",
    {
      "52": true,
      "51": false,
      "54": false,
      "55": false,
    },
  ),
];
