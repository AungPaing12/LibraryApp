import 'package:library_app/data/vos/book_list_vo/book_list_vo.dart';

abstract class HomeScreenDao {
  void save(List<BookListsVO>? bookListVO);

  List<BookListsVO>? getHomeScreenBookListFromDataBase();

  Stream<List<BookListsVO>?> getHomeScreenBookListFromDataBaseStream();

  Stream watchHomeScreenBox();

  void deleteHomeScreenBox(List<BookListsVO>? bookListVO);
}
