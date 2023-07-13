import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/widget/easy_text_widget.dart';

import '../page/detail_page.dart';
import 'bottom_sheet_widget.dart';

class BookTitleImageScroll extends StatelessWidget {
  const BookTitleImageScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: EasyText(
                  text: 'Combined Print And Ebook Fition',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        SizedBox(
          width: double.infinity,
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const BookTitleImageScrollItemView(
                imageURL: 'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
                bookTitle: 'Rich Dad Poor Dad',
              );
            },
          ),
        ),
      ],
    );
  }
}

class BookTitleImageScrollItemView extends StatelessWidget {
  const BookTitleImageScrollItemView(
      {Key? key, required this.imageURL, required this.bookTitle})
      : super(key: key);
  final String imageURL;
  final String bookTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Stack(
            children: [
              SizedBox(
                width: 135,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BookDetailPage()));
                    },
                    child: CachedNetworkImage(
                      imageUrl: imageURL,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'images/tmdb_place_holder.png',
                                fit: BoxFit.cover,
                              ))),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.photo)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 60),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.green,
                          size: 25,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                builder: (context) {
                                  return const SizedBox(
                                      height: 250,
                                      child: BottomSheetWidget(
                                        title: 'Rich Dad Poor Dad',
                                        imageURL:
                                            'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
                                        eBook: true,
                                      ));
                                },
                              );
                            },
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                              size: 25,
                            ))),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: EasyText(
            text: bookTitle,
            fontSize: 14,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
