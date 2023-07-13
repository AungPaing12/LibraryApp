import 'package:dio/dio.dart';
import 'package:library_app/data/vos/item_vo/item_vo.dart';
import '../api/search_library_api/library_api.dart';
import 'library_data_agent.dart';

class LibraryDataAgentImpl extends LibraryDataAgent {
  late LibraryApi _api;

  LibraryDataAgentImpl._() {
    _api = LibraryApi(Dio());
  }

  static final LibraryDataAgentImpl _singleton = LibraryDataAgentImpl._();

  factory LibraryDataAgentImpl() => _singleton;

  @override
  Future<List<Items>?> getSearchLibraryList(String bookName) => _api
      .getSearchBookList(bookName)
      .asStream()
      .map((event) => event.items)
      .first;
}
