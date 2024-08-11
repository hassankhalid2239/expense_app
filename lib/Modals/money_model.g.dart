// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyModelAdapter extends TypeAdapter<MoneyModel> {
  @override
  final int typeId = 0;

  @override
  MoneyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoneyModel(
      category: fields[0] as String,
      detail: fields[1] as String,
      amount: fields[2] as int,
      amountType: fields[3] as bool,
      date: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoneyModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.detail)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.amountType)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
