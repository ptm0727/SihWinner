// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointsmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class pointsmodelAdapter extends TypeAdapter<pointsmodel> {
  @override
  final int typeId = 0;

  @override
  pointsmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return pointsmodel(
      p1: fields[0] as double,
      p2: fields[1] as double,
      p3: fields[2] as double,
      p4: fields[3] as double,
      p5: fields[4] as double,
      p6: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, pointsmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.p1)
      ..writeByte(1)
      ..write(obj.p2)
      ..writeByte(2)
      ..write(obj.p3)
      ..writeByte(3)
      ..write(obj.p4)
      ..writeByte(4)
      ..write(obj.p5)
      ..writeByte(5)
      ..write(obj.p6);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is pointsmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class denominatormodelAdapter extends TypeAdapter<denominatormodel> {
  @override
  final int typeId = 1;

  @override
  denominatormodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return denominatormodel(
      d1: fields[0] as double,
      d2: fields[1] as double,
      d3: fields[2] as double,
      d4: fields[3] as double,
      d5: fields[4] as double,
      d6: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, denominatormodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.d1)
      ..writeByte(1)
      ..write(obj.d2)
      ..writeByte(2)
      ..write(obj.d3)
      ..writeByte(3)
      ..write(obj.d4)
      ..writeByte(4)
      ..write(obj.d5)
      ..writeByte(5)
      ..write(obj.d6);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is denominatormodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class usernamemodelAdapter extends TypeAdapter<usernamemodel> {
  @override
  final int typeId = 2;

  @override
  usernamemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return usernamemodel(
      username: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, usernamemodel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is usernamemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
