import 'package:flutter/material.dart';
import 'package:library_app/data/vos/item_vo/item_vo.dart';
import 'package:library_app/widget/easy_text_widget.dart';
import 'package:library_app/constant/image_constant.dart';
import 'package:provider/provider.dart';

import '../bloc/search_page_bloc.dart';
import '../view_item/search_page_view_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => SearchPageBloc(),
        child: Consumer<SearchPageBloc>(
          builder: (context, bloc, child) => Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        final instance = context.read<SearchPageBloc>();
                        instance.searchBookList(text);
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search Play Books',
                        prefixIcon: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.mic,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                    SearchMovieListTileViewItem(searchBookList: bloc.getSearchBookList,),
                    const SizedBox(
                      height: 20,
                    ),
                    const IconTextViewItem(
                      iconImage: kTopSellingImage,
                      text: 'Top Selling',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const IconTextViewItem(
                      iconImage: kNewReleaseImage,
                      text: 'New release',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const IconTextViewItem(
                      iconImage: kBookShopImage,
                      text: 'Bookshop',
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}

class SearchMovieListTileViewItem extends StatelessWidget {
  const SearchMovieListTileViewItem({Key? key, required this.searchBookList})
      : super(key: key);
  final List<Items>? searchBookList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchBookList?.length,
        itemBuilder: (context, index) {
          return SearchListTileViewItem(
            eBook: searchBookList?[index].saleInfo?.isEbook ?? false,
            imageURL:
                searchBookList?[index].volumeInfo?.imageLinks?.smallThumbnail ??
                    '',
            bookTitle: searchBookList?[index].volumeInfo?.title ?? '',
          );
        },
      ),
    );
  }
}

class IconTextViewItem extends StatelessWidget {
  const IconTextViewItem(
      {Key? key, required this.iconImage, required this.text})
      : super(key: key);
  final String iconImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child:
                SizedBox(height: 30, width: 30, child: Image.asset(iconImage))),
        EasyText(
          text: text,
          fontSize: 16,
          color: Colors.grey,
        )
      ],
    );
  }
}
