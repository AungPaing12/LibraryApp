import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'book_hive_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kBookHiveTypeID)
class BookHiveVO{
  @HiveField(0)
  String?  title;
  @HiveField(1)
  String? image;

  BookHiveVO({this.title, this.image});

}