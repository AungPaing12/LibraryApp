// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeScreenResponseAdapter extends TypeAdapter<HomeScreenResponse> {
  @override
  final int typeId = 11;

  @override
  HomeScreenResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeScreenResponse(
      status: fields[0] as String?,
      copyright: fields[1] as String?,
      numResults: fields[2] as int?,
      results: fields[3] as ResultsVO?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeScreenResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.copyright)
      ..writeByte(2)
      ..write(obj.numResults)
      ..writeByte(3)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeScreenResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenResponse _$HomeScreenResponseFromJson(Map<String, dynamic> json) =>
    HomeScreenResponse(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      results: json['results'] == null
          ? null
          : ResultsVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeScreenResponseToJson(HomeScreenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
