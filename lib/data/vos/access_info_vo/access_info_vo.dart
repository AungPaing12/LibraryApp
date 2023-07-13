import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'access_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kAccessInfoTypeID)
class AccessInfo {
  @JsonKey(name: 'country')
  @HiveField(0)
  String? country;

  @JsonKey(name: 'embeddable')
  @HiveField(1)
  bool? embeddable;

  @JsonKey(name: 'publicDomain')
  @HiveField(2)
  bool? publicDomain;

  @JsonKey(name: 'textToSpeechPermission')
  @HiveField(3)
  String? textToSpeechPermission;

  @JsonKey(name: 'webReaderLink')
  @HiveField(4)
  String? webReaderLink;

  @JsonKey(name: 'accessViewStatus')
  @HiveField(5)
  String? accessViewStatus;

  @JsonKey(name: 'quoteSharingAllowed')
  @HiveField(6)
  bool? quoteSharingAllowed;

  AccessInfo(
      {this.country,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed});

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);
}
