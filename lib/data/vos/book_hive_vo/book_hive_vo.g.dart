// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_hive_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookHiveVOAdapter extends TypeAdapter<BookHiveVO> {
  @override
  final int typeId = 12;

  @override
  BookHiveVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookHiveVO(
      title: fields[0] as String?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookHiveVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookHiveVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookHiveVO _$BookHiveVOFromJson(Map<String, dynamic> json) => BookHiveVO(
      title: json['title'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BookHiveVOToJson(BookHiveVO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
    };
