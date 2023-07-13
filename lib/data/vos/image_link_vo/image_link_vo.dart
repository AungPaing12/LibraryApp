import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'image_link_vo.g.dart';

@HiveType(typeId: kImageLinkVOTypeID)
@JsonSerializable()
class ImageLinks {
  @JsonKey(name: 'smallThumbnail')
  @HiveField(0)
  String? smallThumbnail;

  @JsonKey(name: 'thumbnail')
  @HiveField(1)
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
}
