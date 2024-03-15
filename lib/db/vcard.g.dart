// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vcard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VCardAdapter extends TypeAdapter<VCardHive> {
  @override
  final int typeId = 1;

  @override
  VCardHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VCardHive(
      uid: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      contactNo: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VCardHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.contactNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
