
import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/library_model.dart';
import 'package:library_app/data/model/library_model_impl.dart';
import '../data/vos/item_vo/item_vo.dart';

class SearchPageBloc extends ChangeNotifier {
  final LibraryModel _libraryModel = LibraryModelImpl();
  List<Items> _searchBookList = [];
  bool _dispose = false;

  List<Items> get getSearchBookList => _searchBookList;

  void searchBookList(String name) {
    _libraryModel.getSearchBookList(name).then((value) {
      if (value != null) {
        _searchBookList = value;
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