import 'package:library_app/data/vos/item_vo/item_vo.dart';
import 'package:library_app/network/data_agent/library_data_agent.dart';
import 'package:library_app/network/data_agent/library_data_agent_impl.dart';

import 'library_model.dart';

class LibraryModelImpl extends LibraryModel {
  LibraryModelImpl._();

  static final LibraryModelImpl _singleton = LibraryModelImpl._();

  factory LibraryModelImpl() => _singleton;
  final LibraryDataAgent _libraryDataAgent = LibraryDataAgentImpl();
  @override
  Future<List<Items>?> getSearchBookList(String bookName) => _libraryDataAgent.getSearchLibraryList(bookName);
}
