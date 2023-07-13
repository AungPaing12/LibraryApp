import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'sale_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kSaleInfoVOTypeID)
class SaleInfo {
  @JsonKey(name: 'country')
  @HiveField(0)
  String? country;

  @JsonKey(name: 'saleability')
  @HiveField(1)
  String? saleability;

  @JsonKey(name: 'isEbook')
  @HiveField(2)
  bool? isEbook;

  @JsonKey(name: 'buyLink')
  @HiveField(3)
  String? buyLink;

  SaleInfo({this.country, this.saleability, this.isEbook, this.buyLink});

  factory SaleInfo.fromJson(Map<String,dynamic>json) => _$SaleInfoFromJson(json);

}