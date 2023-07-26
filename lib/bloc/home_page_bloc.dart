import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/library_model.dart';
import 'package:library_app/data/model/library_model_impl.dart';
import 'package:library_app/data/vos/book_list_vo/book_list_vo.dart';
import '../data/vos/book_hive_vo/book_hive_vo.dart';
import '../data/vos/book_vo/book_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final LibraryModel _libraryModel = LibraryModelImpl();
  List<BookListsVO> _homeScreenBookList = [];
  int _selectedIndex = 0;
  bool _dispose = false;

  List<BookListsVO>? get getHomeScreenBookList => _homeScreenBookList;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  HomePageBloc() {
    DateTime dateTime = DateTime.now();
    String monthFormat = (dateTime.month.toString().length) == 2
        ? dateTime.month.toString()
        : '0${dateTime.month.toString()}';
    String dayFormat = (dateTime.day.toString().length) == 2
        ? dateTime.day.toString()
        : '0${dateTime.day.toString()}';
    String publishDate = '${dateTime.year}-$monthFormat-$dayFormat';
    _libraryModel.getHomeScreenBookList(publishDate);
    _libraryModel.getHomeScreenBookListFromDataBase().listen((event) {
      if (event != null) {
        _homeScreenBookList = event;
      }
      if (event == null && event!.isEmpty) {
        event = null;
      }
      notifyListeners();
    });
  }

  saveBookHive(BooksVO? booksVO) {
    final bookHiveList =
        BookHiveVO(title: booksVO?.title, image: booksVO?.bookImage);
    _libraryModel.saveInLibrary(bookHiveList);
  }


  deleteFromHive(BooksVO? booksVO) {
    final bookHiveList =
        BookHiveVO(title: booksVO?.title, image: booksVO?.bookImage);
    _libraryModel.delete(bookHiveList);
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
