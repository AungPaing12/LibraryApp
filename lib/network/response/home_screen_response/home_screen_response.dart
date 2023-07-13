import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/result_vo/result_vo.dart';
import '../../../constant/hive_constant.dart';

part 'home_screen_response.g.dart';

@JsonSerializable()
@HiveType(typeId: kHomeScreenResponseTypeID)
class HomeScreenResponse {
  @JsonKey(name: 'status')
  @HiveField(0)
  String? status;

  @JsonKey(name: 'copyright')
  @HiveField(1)
  String? copyright;

  @JsonKey(name: 'num_results')
  @HiveField(2)
  int? numResults;

  @JsonKey(name: 'results')
  @HiveField(3)
  ResultsVO? results;

  HomeScreenResponse(
      {this.status, this.copyright, this.numResults, this.results});

  factory HomeScreenResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenResponseFromJson(json);
}
