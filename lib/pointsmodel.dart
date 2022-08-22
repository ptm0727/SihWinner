import 'package:hive/hive.dart';

part 'pointsmodel.g.dart';
@HiveType(typeId: 0)
class pointsmodel extends HiveObject{
  pointsmodel({required this.p1,required this.p2,required this.p3,required this.p4,required this.p5,required this.p6,});
  @HiveField(0)
  late double p1;
  @HiveField(1)
  late double p2;
  @HiveField(2)
  late double p3;
  @HiveField(3)
  late double p4;
  @HiveField(4)
  late double p5;
  @HiveField(5)
  late double p6;

}
