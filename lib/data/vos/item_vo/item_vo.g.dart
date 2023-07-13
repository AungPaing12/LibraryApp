// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsAdapter extends TypeAdapter<Items> {
  @override
  final int typeId = 6;

  @override
  Items read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Items(
      kind: fields[0] as String?,
      id: fields[1] as String?,
      selfLink: fields[2] as String?,
      volumeInfo: fields[3] as VolumeInfo?,
      saleInfo: fields[4] as SaleInfo?,
      accessInfo: fields[5] as AccessInfo?,
      searchInfo: fields[6] as SearchInfo?,
    );
  }

  @override
  void write(BinaryWriter writer, Items obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.selfLink)
      ..writeByte(3)
      ..write(obj.volumeInfo)
      ..writeByte(4)
      ..write(obj.saleInfo)
      ..writeByte(5)
      ..write(obj.accessInfo)
      ..writeByte(6)
      ..write(obj.searchInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] == null
          ? null
          : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
      accessInfo: json['accessInfo'] == null
          ? null
          : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
      searchInfo: json['searchInfo'] == null
          ? null
          : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
      'searchInfo': instance.searchInfo,
    };
