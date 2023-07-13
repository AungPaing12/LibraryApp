// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookListsVOAdapter extends TypeAdapter<BookListsVO> {
  @override
  final int typeId = 9;

  @override
  BookListsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookListsVO(
      listId: fields[0] as int?,
      listName: fields[1] as String?,
      listNameEncoded: fields[2] as String?,
      displayName: fields[3] as String?,
      updated: fields[4] as String?,
      books: (fields[5] as List?)?.cast<BooksVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookListsVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.listId)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookListsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListsVO _$BookListsVOFromJson(Map<String, dynamic> json) => BookListsVO(
      listId: json['list_id'] as int?,
      listName: json['list_name'] as String?,
      listNameEncoded: json['list_name_encoded'] as String?,
      displayName: json['display_name'] as String?,
      updated: json['updated'] as String?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListsVOToJson(BookListsVO instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'books': instance.books,
    };
