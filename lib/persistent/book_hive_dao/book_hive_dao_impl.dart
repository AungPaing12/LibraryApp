import 'package:library_app/data/vos/book_hive_vo/book_hive_vo.dart';
import '../../constant/hive_constant.dart';
import 'book_hive_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookHiveDaoImpl extends BookHiveDao {
  BookHiveDaoImpl._();

  static final BookHiveDaoImpl _singleton = BookHiveDaoImpl._();

  factory BookHiveDaoImpl() => _singleton;

  @override
  List<BookHiveVO>? getHiveBookListFromDataBase() =>
      _bookHiveVO().values.toList();

  @override
  Stream<List<BookHiveVO>?> getHiveBookListFromDataBaseStream() =>
      Stream.value(getHiveBookListFromDataBase());

  Box<BookHiveVO> _bookHiveVO() => Hive.box(kBoxNameForBookHiveVO);

  @override
  void save(BookHiveVO bookHiveVO) {
    _bookHiveVO().put(bookHiveVO.title, bookHiveVO);
  }

  @override
  Stream watchBookHiveBox() => _bookHiveVO().watch();
}
