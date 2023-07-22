import 'package:library_app/data/vos/book_hive_vo/book_hive_vo.dart';

abstract class BookHiveDao {
  void save(BookHiveVO bookHiveVO);

  List<BookHiveVO>? getHiveBookListFromDataBase();

  Stream<List<BookHiveVO>?> getHiveBookListFromDataBaseStream();

  Stream watchBookHiveBox();

}
