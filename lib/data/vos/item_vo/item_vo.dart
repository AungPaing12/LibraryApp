import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import '../access_info_vo/access_info_vo.dart';
import '../sale_info_vo/sale_info_vo.dart';
import '../search_info_vo/search_info_vo.dart';
import '../volume_info_vo/volume_info_vo.dart';

part 'item_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kItemsVOTypeID)
class Items {
  @JsonKey(name: 'kind')
  @HiveField(0)
  String? kind;

  @JsonKey(name: 'id')
  @HiveField(1)
  String? id;

  @JsonKey(name: 'selfLink')
  @HiveField(2)
  String? selfLink;

  @JsonKey(name: 'volumeInfo')
  @HiveField(3)
  VolumeInfo? volumeInfo;

  @JsonKey(name: 'saleInfo')
  @HiveField(4)
  SaleInfo? saleInfo;

  @JsonKey(name: 'accessInfo')
  @HiveField(5)
  AccessInfo? accessInfo;

  @JsonKey(name: 'searchInfo')
  @HiveField(6)
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
