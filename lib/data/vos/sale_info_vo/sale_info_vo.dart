import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';


part 'sale_info_vo.g.dart';

@JsonSerializable()
class SaleInfo {
  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'saleability')
  String? saleability;

  @JsonKey(name: 'isEbook')
  bool? isEbook;

  @JsonKey(name: 'buyLink')
  String? buyLink;

  SaleInfo({this.country, this.saleability, this.isEbook, this.buyLink});

  factory SaleInfo.fromJson(Map<String,dynamic>json) => _$SaleInfoFromJson(json);

}