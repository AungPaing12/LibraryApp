import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_app/data/vos/book_list_vo/book_list_vo.dart';
import '../../constant/hive_constant.dart';
import 'home_screen_dao.dart';

class HomeScreenDaoImpl extends HomeScreenDao {
  HomeScreenDaoImpl._();

  static final HomeScreenDaoImpl _singleton = HomeScreenDaoImpl._();

  factory HomeScreenDaoImpl() => _singleton;

  @override
  List<BookListsVO>? getHomeScreenBookListFromDataBase() =>
      _bookListBox().values.toList();

  @override
  Stream<List<BookListsVO>?> getHomeScreenBookListFromDataBaseStream() =>
      Stream.value(getHomeScreenBookListFromDataBase());

  Box<BookListsVO> _bookListBox() => Hive.box(kBoxNameForBookListVO);

  @override
  void save(List<BookListsVO>? bookListVO) {
    for (BookListsVO bookListsVO in bookListVO!) {
      _bookListBox().put(bookListsVO.listId, bookListsVO);
    }
  }

  @override
  Stream watchHomeScreenBox() => _bookListBox().watch();

  @override
  void deleteHomeScreenBox(List<BookListsVO>? bookListVO) {
    for (BookListsVO bookListsVO in bookListVO!) {
      _bookListBox().delete(bookListsVO.listId);
    }
  }



}
