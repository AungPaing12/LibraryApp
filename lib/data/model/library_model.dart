import 'package:library_app/data/vos/item_vo/item_vo.dart';

abstract class LibraryModel{

  Future<List<Items>?> getSearchBookList(String bookName);
}