import 'package:dio/dio.dart';
import 'package:library_app/data/vos/book_list_vo/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo/book_vo.dart';

import '../../../constant/api_constant.dart';
import '../../api/home_screen_api/home_screen_api.dart';
import 'home_screen_api_data_agent.dart';

class HomeScreenApiDataAgentImpl extends HomeScreenApiDataAgent {
  late HomeScreenApi _api;

  HomeScreenApiDataAgentImpl._() {
    _api = HomeScreenApi(Dio());
  }

  static final HomeScreenApiDataAgentImpl _singleton =
      HomeScreenApiDataAgentImpl._();

  factory HomeScreenApiDataAgentImpl() => _singleton;

  @override
  Future<List<BookListsVO>?> getHomeScreenBookList(publishedDate) => _api
      .getHomeScreenBookList(publishedDate, kApikey)
      .asStream()
      .map((event) => event.results?.lists)
      .first;

}
