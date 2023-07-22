import 'package:flutter/material.dart';
import 'package:library_app/page/audio_book.dart';
import 'e_book.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: Column(
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
                      Tab(text: "EBook",),
                      Tab(text: "AudioBook",),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: TabBarView(
                    children: [
                      EBookPage(),
                      AudioBookPage()
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
