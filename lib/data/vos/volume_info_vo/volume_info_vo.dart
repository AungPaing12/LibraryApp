import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../image_link_vo/image_link_vo.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfo {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'subtitle')
  String? subtitle;

  @JsonKey(name: 'authors')
  List<String>? authors;

  @JsonKey(name: 'publishedDate')
  String? publishedDate;

  @JsonKey(name: 'pageCount')
  int? pageCount;

  @JsonKey(name: 'printType')
  String? printType;

  @JsonKey(name: 'maturityRating')
  String? maturityRating;

  @JsonKey(name: 'allowAnonLogging')
  bool? allowAnonLogging;

  @JsonKey(name: 'contentVersion')
  String? contentVersion;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'previewLink')
  String? previewLink;

  @JsonKey(name: 'infoLink')
  String? infoLink;

  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;

  @JsonKey(name: 'imageLinks')
  ImageLinks? imageLinks;

  @JsonKey(name: 'categories')
  List<String>? categories;

  @JsonKey(name: 'description')
  String? description;

  VolumeInfo(
      {this.title,
      this.subtitle,
      this.authors,
      this.publishedDate,
      this.pageCount,
      this.printType,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink,
      this.imageLinks,
      this.categories,
      this.description});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  @override
  String toString() {
    return 'VolumeInfo{title: $title, subtitle: $subtitle, authors: $authors, publishedDate: $publishedDate, pageCount: $pageCount, printType: $printType, maturityRating: $maturityRating, allowAnonLogging: $allowAnonLogging, contentVersion: $contentVersion, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink, imageLinks: $imageLinks, categories: $categories, description: $description}';
  }
}
