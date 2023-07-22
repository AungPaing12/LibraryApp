import 'package:flutter/material.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/page/home_page.dart';
import 'package:provider/provider.dart';

import '../view_item/home_page_view_item.dart';
import 'library_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePage(),
      const LibraryPage(),
    ];
    return ChangeNotifierProvider(
      create: (context) => HomePageBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: SearchPlayButtonContainer()),
        ),
        bottomNavigationBar: Consumer<HomePageBloc>(
          builder: (context, bloc, child) => BottomNavigationBar(
            currentIndex: bloc.selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            //showUnselectedLabels: false,
            onTap: (index) {
              final instance = context.read<HomePageBloc>();
              instance.setIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  label: "Library",
                  icon: Icon(
                    Icons.library_books,
                  )),
            ],
          ),
        ),
        body: Consumer<HomePageBloc>(
          builder: (context, bloc, child) => IndexedStack(
            index: bloc.selectedIndex,
            children: pages,
          ),
        ),
      ),
    );
  }
}
