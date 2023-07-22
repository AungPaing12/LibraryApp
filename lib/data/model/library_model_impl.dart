import 'package:library_app/data/vos/book_hive_vo/book_hive_vo.dart';
import 'package:library_app/data/vos/book_list_vo/book_list_vo.dart';
import 'package:library_app/data/vos/item_vo/item_vo.dart';
import 'package:library_app/network/data_agent/home_screen_api_data_agent/home_screen_api_data_agent.dart';
import 'package:library_app/network/data_agent/home_screen_api_data_agent/home_screen_api_data_agent_impl.dart';
import 'package:library_app/persistent/book_hive_dao/book_hive_dao.dart';
import 'package:library_app/persistent/book_hive_dao/book_hive_dao_impl.dart';
import 'package:library_app/persistent/home_screen_dao/home_screen_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../network/data_agent/library_data_agent/library_data_agent.dart';
import '../../network/data_agent/library_data_agent/library_data_agent_impl.dart';
import '../../persistent/home_screen_dao/home_screen_dao.dart';
import 'library_model.dart';

class LibraryModelImpl extends LibraryModel {
  LibraryModelImpl._();

  static final LibraryModelImpl _singleton = LibraryModelImpl._();

  factory LibraryModelImpl() => _singleton;
  final LibraryDataAgent _libraryDataAgent = LibraryDataAgentImpl();
  final HomeScreenDao _homeScreenDao = HomeScreenDaoImpl();
  final BookHiveDao _bookHiveDao = BookHiveDaoImpl();
  final HomeScreenApiDataAgent _homeScreenApiDataAgent =
      HomeScreenApiDataAgentImpl();

  @override
  Future<List<Items>?> getSearchBookList(String bookName) =>
      _libraryDataAgent.getSearchLibraryList(bookName);

  @override
  Future<List<BookListsVO>?> getHomeScreenBookList(publishedDate) =>
      _homeScreenApiDataAgent.getHomeScreenBookList(publishedDate).then((value) {
        if (value != null) {
          _homeScreenDao.save(value);
        }
      });

  @override
  Stream<List<BookListsVO>?> getHomeScreenBookListFromDataBase() =>
      _homeScreenDao
          .watchHomeScreenBox()
          .startWith(_homeScreenDao.getHomeScreenBookListFromDataBaseStream())
          .map((event) => _homeScreenDao.getHomeScreenBookListFromDataBase());

  @override
  Stream<List<BookHiveVO>?> getBookHiveListFromDataBase() => _bookHiveDao
      .watchBookHiveBox()
      .startWith(_bookHiveDao.getHiveBookListFromDataBaseStream())
      .map((event) => _bookHiveDao.getHiveBookListFromDataBase());

  @override
  void save(BookHiveVO bookHiveVO) {
    _bookHiveDao.save(bookHiveVO);
  }
}
