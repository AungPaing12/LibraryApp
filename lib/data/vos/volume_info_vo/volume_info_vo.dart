import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import '../image_link_vo/image_link_vo.dart';

part 'volume_info_vo.g.dart';
@HiveType(typeId: kVolumeInfoVOTypeID)
@JsonSerializable()

class VolumeInfo {
  @HiveField(0)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(1)
  @JsonKey(name: 'subtitle')
  String? subtitle;

  @HiveField(2)
  @JsonKey(name: 'authors')
  List<String>? authors;

  @HiveField(3)
  @JsonKey(name: 'publishedDate')
  String? publishedDate;

  @HiveField(4)
  @JsonKey(name: 'pageCount')
  int? pageCount;

  @HiveField(5)
  @JsonKey(name: 'printType')
  String? printType;

  @HiveField(6)
  @JsonKey(name: 'maturityRating')
  String? maturityRating;

  @HiveField(7)
  @JsonKey(name: 'allowAnonLogging')
  bool? allowAnonLogging;

  @HiveField(8)
  @JsonKey(name: 'contentVersion')
  String? contentVersion;

  @HiveField(9)
  @JsonKey(name: 'language')
  String? language;

  @HiveField(10)
  @JsonKey(name: 'previewLink')
  String? previewLink;

  @HiveField(11)
  @JsonKey(name: 'infoLink')
  String? infoLink;

  @HiveField(12)
  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;

  @HiveField(13)
  @JsonKey(name: 'imageLinks')
  ImageLinks? imageLinks;

  @HiveField(14)
  @JsonKey(name: 'categories')
  List<String>? categories;

  @HiveField(15)
  @JsonKey(name: 'description')
  String? description;

  VolumeInfo({this.title,
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

  factory VolumeInfo.fromJson(Map<String,dynamic>json) => _$VolumeInfoFromJson(json);
}