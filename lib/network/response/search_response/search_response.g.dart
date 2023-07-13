// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchResponseAdapter extends TypeAdapter<SearchResponse> {
  @override
  final int typeId = 7;

  @override
  SearchResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchResponse(
      kind: fields[0] as String?,
      totalItems: fields[1] as int?,
      items: (fields[2] as List?)?.cast<Items>(),
    );
  }

  @override
  void write(BinaryWriter writer, SearchResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.totalItems)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      kind: json['kind'] as String?,
      totalItems: json['totalItems'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
