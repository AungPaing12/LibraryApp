
import '../../../data/vos/item_vo/item_vo.dart';

abstract class LibraryDataAgent {
  Future<List<Items>?> getSearchLibraryList(String bookName);

}
