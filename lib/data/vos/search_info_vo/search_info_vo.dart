import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'search_info_vo.g.dart';

@HiveType(typeId: kSearchInfoVOTypeID)
@JsonSerializable()
class SearchInfo {
  @JsonKey(name: 'textSnippet')
  @HiveField(0)
  String? textSnippet;

  SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoFromJson(json);
}
