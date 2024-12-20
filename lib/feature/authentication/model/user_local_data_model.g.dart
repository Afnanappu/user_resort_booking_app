// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocalDataModelAdapter extends TypeAdapter<UserLocalDataModel> {
  @override
  final int typeId = 0;

  @override
  UserLocalDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocalDataModel(
      uid: fields[0] as String?,
      name: fields[1] as String,
      email: fields[2] as String,
      profilePicture: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocalDataModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.profilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocalDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
