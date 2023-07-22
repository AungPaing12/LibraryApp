import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kBookVOTypeID)
class BooksVO {
  @JsonKey(name: 'age_group')
  @HiveField(0)
  String? ageGroup;

  @JsonKey(name: 'amazon_product_url')
  @HiveField(1)
  String? amazonProductUrl;

  @JsonKey(name: 'article_chapter_link')
  @HiveField(2)
  String? articleChapterLink;

  @JsonKey(name: 'author')
  @HiveField(3)
  String? author;

  @JsonKey(name: 'book_image')
  @HiveField(4)
  String? bookImage;

  @JsonKey(name: 'book_image_width')
  @HiveField(5)
  int? bookImageWidth;

  @JsonKey(name: 'book_image_height')
  @HiveField(6)
  int? bookImageHeight;

  @JsonKey(name: 'book_review_link')
  @HiveField(7)
  String? bookReviewLink;

  @JsonKey(name: 'contributor')
  @HiveField(8)
  String? contributor;

  @JsonKey(name: 'created_date')
  @HiveField(9)
  String? createdDate;

  @JsonKey(name: 'description')
  @HiveField(10)
  String? description;

  @JsonKey(name: 'first_chapter_link')
  @HiveField(11)
  String? firstChapterLink;

  @JsonKey(name: 'price')
  @HiveField(12)
  String? price;

  @JsonKey(name: 'primary_isbn10')
  @HiveField(13)
  String? primaryIsbn10;

  @JsonKey(name: 'primary_isbn13')
  @HiveField(14)
  String? primaryIsbn13;

  @JsonKey(name: 'book_uri')
  @HiveField(15)
  String? bookUri;

  @JsonKey(name: 'publisher')
  @HiveField(16)
  String? publisher;

  @JsonKey(name: 'rank')
  @HiveField(17)
  int? rank;

  @JsonKey(name: 'rank_last_week')
  @HiveField(18)
  int? rankLastWeek;

  @JsonKey(name: 'sunday_review_link')
  @HiveField(19)
  String? sundayReviewLink;

  @JsonKey(name: 'title')
  @HiveField(20)
  String? title;

  @JsonKey(name: 'updated_date')
  @HiveField(21)
  String? updatedDate;

  @JsonKey(name: 'weeks_on_list')
  @HiveField(22)
  int? weeksOnList;

  @HiveField(23)
  bool isSelected ;
  BooksVO({
    this.ageGroup,
    this.amazonProductUrl,
    this.articleChapterLink,
    this.author,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.bookReviewLink,
    this.contributor,
    this.createdDate,
    this.description,
    this.firstChapterLink,
    this.price,
    this.primaryIsbn10,
    this.primaryIsbn13,
    this.bookUri,
    this.publisher,
    this.rank,
    this.rankLastWeek,
    this.sundayReviewLink,
    this.title,
    this.updatedDate,
    this.weeksOnList,
    this.isSelected = false
  });

  factory BooksVO.fromJson(Map<String, dynamic> json) =>
      _$BooksVOFromJson(json);

  @override
  String toString() {
    return 'BooksVO{ageGroup: $ageGroup, amazonProductUrl: $amazonProductUrl, articleChapterLink: $articleChapterLink, bookImage: $bookImage,'
        ' bookImageHeight: $bookImageHeight, description: $description, primaryIsbn10: $primaryIsbn10, rankLastWeek: $rankLastWeek,'
        ' title: $title, updatedDate: $updatedDate}';
  }
}
