import 'package:library_app/data/vos/book_hive_vo/book_hive_vo.dart';
import 'package:library_app/data/vos/item_vo/item_vo.dart';

import '../vos/book_list_vo/book_list_vo.dart';
import '../vos/book_vo/book_vo.dart';

abstract class LibraryModel{

  Future<List<Items>?> getSearchBookList(String bookName);

  Future<List<BookListsVO>?> getHomeScreenBookList(String publishedDate);

  Stream<List<BookListsVO>?> getHomeScreenBookListFromDataBase();

  void save (BookHiveVO bookHiveVO);

  Stream<List<BookHiveVO>?> getBookHiveListFromDataBase();

}