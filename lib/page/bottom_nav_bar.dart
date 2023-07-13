import 'package:flutter/material.dart';
import 'package:library_app/page/home_page.dart';

import '../view_item/home_page_view_item.dart';
import 'library_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pages = [
    const HomePage(),
    const LibraryPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          //showUnselectedLabels: false,
          onTap: (index) {
            if (mounted) {
              setState(() {
                currentIndex = index;
              });
            }
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
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
    );
  }
}
