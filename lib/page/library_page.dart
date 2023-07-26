import 'package:flutter/material.dart';
import 'package:library_app/page/your_book.dart';
import 'package:library_app/page/your_shelves.dart';

import '../view_item/home_page_view_item.dart';
import 'add_to_shelf_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    labelPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 50),
                    labelColor: Colors.black,
                    indicatorColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2,
                    tabs: [
                      Tab(text: "Your Book",),
                      Tab(text: "YourShelves",),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: TabBarView(
                    children: [
                      YourBookPage(),
                      AddToShelfPage()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
