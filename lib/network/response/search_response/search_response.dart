import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../constant/hive_constant.dart';
import '../../../data/vos/item_vo/item_vo.dart';

part 'search_response.g.dart';

@JsonSerializable()
@HiveType(typeId: kSearchResponseTypeID)
class SearchResponse {
  @HiveField(0)
  @JsonKey(name: 'kind')
  String? kind;

  @HiveField(1)
  @JsonKey(name: 'totalItems')
  int? totalItems;

  @HiveField(2)
  @JsonKey(name: 'items')
  List<Items>? items;

  SearchResponse({this.kind, this.totalItems, this.items});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
