// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodosAdapter extends TypeAdapter<Todos> {
  @override
  final int typeId = 3;

  @override
  Todos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todos(
      startTimeHour: fields[0] as int?,
      startTimeMinute: fields[1] as int?,
      endTimeHour: fields[2] as int?,
      endTimeMinute: fields[3] as int?,
      name: fields[4] as String,
      color: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Todos obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.startTimeHour)
      ..writeByte(1)
      ..write(obj.startTimeMinute)
      ..writeByte(2)
      ..write(obj.endTimeHour)
      ..writeByte(3)
      ..write(obj.endTimeMinute)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}