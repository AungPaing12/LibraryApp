// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccessInfoAdapter extends TypeAdapter<AccessInfo> {
  @override
  final int typeId = 3;

  @override
  AccessInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccessInfo(
      country: fields[0] as String?,
      embeddable: fields[1] as bool?,
      publicDomain: fields[2] as bool?,
      textToSpeechPermission: fields[3] as String?,
      webReaderLink: fields[4] as String?,
      accessViewStatus: fields[5] as String?,
      quoteSharingAllowed: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AccessInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.embeddable)
      ..writeByte(2)
      ..write(obj.publicDomain)
      ..writeByte(3)
      ..write(obj.textToSpeechPermission)
      ..writeByte(4)
      ..write(obj.webReaderLink)
      ..writeByte(5)
      ..write(obj.accessViewStatus)
      ..writeByte(6)
      ..write(obj.quoteSharingAllowed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessInfo _$AccessInfoFromJson(Map<String, dynamic> json) => AccessInfo(
      country: json['country'] as String?,
      embeddable: json['embeddable'] as bool?,
      publicDomain: json['publicDomain'] as bool?,
      textToSpeechPermission: json['textToSpeechPermission'] as String?,
      webReaderLink: json['webReaderLink'] as String?,
      accessViewStatus: json['accessViewStatus'] as String?,
      quoteSharingAllowed: json['quoteSharingAllowed'] as bool?,
    );

Map<String, dynamic> _$AccessInfoToJson(AccessInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'embeddable': instance.embeddable,
      'publicDomain': instance.publicDomain,
      'textToSpeechPermission': instance.textToSpeechPermission,
      'webReaderLink': instance.webReaderLink,
      'accessViewStatus': instance.accessViewStatus,
      'quoteSharingAllowed': instance.quoteSharingAllowed,
    };
