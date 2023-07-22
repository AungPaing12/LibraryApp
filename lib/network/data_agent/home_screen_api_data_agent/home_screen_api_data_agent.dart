
import '../../../data/vos/book_list_vo/book_list_vo.dart';

abstract class HomeScreenApiDataAgent{
  Future<List<BookListsVO>?> getHomeScreenBookList(String publishedDate);

}