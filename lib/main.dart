import 'package:flutter/material.dart';
import 'package:library_app/constant/hive_constant.dart';
import 'package:library_app/data/model/library_model.dart';
import 'package:library_app/data/model/library_model_impl.dart';
import 'package:library_app/data/vos/book_hive_vo/book_hive_vo.dart';
import 'package:library_app/data/vos/book_list_vo/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo/book_vo.dart';
import 'package:library_app/data/vos/result_vo/result_vo.dart';
import 'package:library_app/page/bottom_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

final LibraryModel _libraryModel = LibraryModelImpl();

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookListsVOAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(ResultsVOAdapter());
  Hive.registerAdapter(BookHiveVOAdapter());
  await Hive.openBox<BookListsVO>(kBoxNameForBookListVO);
  await Hive.openBox<BookHiveVO>(kBoxNameForBookHiveVO);
  await Hive.openBox(kBoxNameForShelf);
  runApp(const MyApp());
  // _libraryModel.getHomeScreenBookList().then((value) => print('book=>$value')).onError((error, stackTrace) => print(error));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: const BottomNavBar(),
      );
}
