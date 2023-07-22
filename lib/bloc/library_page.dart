
import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/library_model.dart';
import 'package:library_app/data/model/library_model_impl.dart';
import 'package:library_app/data/vos/book_hive_vo/book_hive_vo.dart';

class LibraryPageBloc extends ChangeNotifier {
  final LibraryModel _libraryModel = LibraryModelImpl();

  List<BookHiveVO> _bookHiveList = [];
  bool _dispose = false;

  List<BookHiveVO> get getBookHiveList => _bookHiveList;

  LibraryPageBloc(){
    _libraryModel.getBookHiveListFromDataBase().listen((event) {
      if(event != null) {
        _bookHiveList = event;
      }
      notifyListeners();
    });
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
