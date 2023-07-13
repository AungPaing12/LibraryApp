import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import '../book_vo/book_vo.dart';

part 'book_list_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kBookListsVOTypeID)
class BookListsVO {
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int? listId;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String? listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String? displayName;

  @JsonKey(name: 'updated')
  @HiveField(4)
  String? updated;

  @JsonKey(name: 'books')
  @HiveField(5)
  List<BooksVO>? books;

  BookListsVO(
      {this.listId,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.books});

  factory BookListsVO.fromJson(Map<String, dynamic> json) =>
      _$BookListsVOFromJson(json);
}
