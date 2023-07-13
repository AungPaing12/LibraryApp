// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeInfoAdapter extends TypeAdapter<VolumeInfo> {
  @override
  final int typeId = 1;

  @override
  VolumeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfo(
      title: fields[0] as String?,
      subtitle: fields[1] as String?,
      authors: (fields[2] as List?)?.cast<String>(),
      publishedDate: fields[3] as String?,
      pageCount: fields[4] as int?,
      printType: fields[5] as String?,
      maturityRating: fields[6] as String?,
      allowAnonLogging: fields[7] as bool?,
      contentVersion: fields[8] as String?,
      language: fields[9] as String?,
      previewLink: fields[10] as String?,
      infoLink: fields[11] as String?,
      canonicalVolumeLink: fields[12] as String?,
      imageLinks: fields[13] as ImageLinks?,
      categories: (fields[14] as List?)?.cast<String>(),
      description: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfo obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.authors)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.pageCount)
      ..writeByte(5)
      ..write(obj.printType)
      ..writeByte(6)
      ..write(obj.maturityRating)
      ..writeByte(7)
      ..write(obj.allowAnonLogging)
      ..writeByte(8)
      ..write(obj.contentVersion)
      ..writeByte(9)
      ..write(obj.language)
      ..writeByte(10)
      ..write(obj.previewLink)
      ..writeByte(11)
      ..write(obj.infoLink)
      ..writeByte(12)
      ..write(obj.canonicalVolumeLink)
      ..writeByte(13)
      ..write(obj.imageLinks)
      ..writeByte(14)
      ..write(obj.categories)
      ..writeByte(15)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishedDate: json['publishedDate'] as String?,
      pageCount: json['pageCount'] as int?,
      printType: json['printType'] as String?,
      maturityRating: json['maturityRating'] as String?,
      allowAnonLogging: json['allowAnonLogging'] as bool?,
      contentVersion: json['contentVersion'] as String?,
      language: json['language'] as String?,
      previewLink: json['previewLink'] as String?,
      infoLink: json['infoLink'] as String?,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$VolumeInfoToJson(VolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publishedDate': instance.publishedDate,
      'pageCount': instance.pageCount,
      'printType': instance.printType,
      'maturityRating': instance.maturityRating,
      'allowAnonLogging': instance.allowAnonLogging,
      'contentVersion': instance.contentVersion,
      'language': instance.language,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
      'canonicalVolumeLink': instance.canonicalVolumeLink,
      'imageLinks': instance.imageLinks,
      'categories': instance.categories,
      'description': instance.description,
    };
