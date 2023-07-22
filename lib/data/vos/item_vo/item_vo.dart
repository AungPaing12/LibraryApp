import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../access_info_vo/access_info_vo.dart';
import '../sale_info_vo/sale_info_vo.dart';
import '../search_info_vo/search_info_vo.dart';
import '../volume_info_vo/volume_info_vo.dart';

part 'item_vo.g.dart';

@JsonSerializable()
class Items {
  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'selfLink')
  String? selfLink;

  @JsonKey(name: 'volumeInfo')
  VolumeInfo? volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfo? saleInfo;

  @JsonKey(name: 'accessInfo')
  AccessInfo? accessInfo;

  @JsonKey(name: 'searchInfo')
  SearchInfo? searchInfo;

  Items(
      {this.kind,
      this.id,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  @override
  String toString() {
    return 'Items{kind: $kind, id: $id, selfLink: $selfLink, volumeInfo: $volumeInfo, saleInfo: $saleInfo, accessInfo: $accessInfo, searchInfo: $searchInfo}';
  }
}
