
import 'package:flutter/material.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/data/vos/book_list_vo/book_list_vo.dart';
import 'package:provider/provider.dart';

import '../widget/book_title_image_scroll.dart';
import '../widget/easy_text_widget.dart';

class EBookPage extends StatelessWidget {
  const EBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomePageBloc(),
        child: Selector<HomePageBloc, List<BookListsVO>?>(
          selector: (_, bloc) => bloc.getHomeScreenBookList,
          builder: (context, homeBookList, child) => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: homeBookList?.length,
              itemBuilder: (context, index) {
                if (homeBookList == null) {
                  return const Center(
                    child: EasyText(text: 'NoData'),
                  );
                }
                if (homeBookList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.37,
                  child: BookTitleImageScroll(
                    bookVO: homeBookList[index].books,
                    bookListTitle:
                        homeBookList[index].listName ?? '',
                  ),
                );
              }),
        ));
  }
}
