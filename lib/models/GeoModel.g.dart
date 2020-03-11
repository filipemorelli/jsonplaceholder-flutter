// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GeoModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoModelAdapter extends TypeAdapter<GeoModel> {
  @override
  final typeId = 5;

  @override
  GeoModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoModel(
      lat: fields[0] as String,
      lng: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }
}
