import 'package:flutter/material.dart';
import 'package:library_app/data/model/library_model.dart';
import 'package:library_app/data/model/library_model_impl.dart';
import 'package:library_app/page/bottom_nav_bar.dart';
final LibraryModel _libraryModel = LibraryModelImpl();
void main() {
  runApp(const MyApp());
  // _libraryModel.getSearchBookList('growth').then((value) => print(value));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      );
}
