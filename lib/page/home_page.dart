import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/bloc/library_page.dart';
import 'package:library_app/constant/image_constant.dart';
import 'package:library_app/page/audio_book.dart';
import 'package:library_app/page/detail_page.dart';
import 'package:provider/provider.dart';
import '../bloc/home_page_bloc.dart';
import '../data/vos/book_hive_vo/book_hive_vo.dart';
import '../data/vos/book_list_vo/book_list_vo.dart';
import 'e_book.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ChangeNotifierProvider(
                  create: (context) => LibraryPageBloc(),
                  child: Selector<LibraryPageBloc, List<BookHiveVO>?>(
                    selector: (_, bloc) => bloc.getBookHiveList,
                    builder: (context, bookList, child) => Padding(
                       padding: const EdgeInsets.only(top: 15),
                      child: Visibility(
                        visible: (bookList!.isEmpty)? false : true,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 300,
                            aspectRatio: 5 / 3,
                            reverse: true,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: bookList.reversed
                              .map((book) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BookDetailPage()));
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl: book.image ?? '',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                    kBookPlaceHolderImage))),
                                        errorWidget: (context, url, error) =>
                                            const Center(child: Icon(Icons.error)),
                                      ),
                                    ),
                                  ),
                                );
                              })
                              .take(3).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      labelPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                      labelColor: Colors.black,
                      indicatorColor: Colors.green,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 2,
                      tabs: [
                        Tab(
                          text: "EBook",
                        ),
                        Tab(
                          text: "AudioBook",
                        ),
                      ],
                    ),
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) => HomePageBloc(),
                  child: Selector<HomePageBloc, List<BookListsVO>?>(
                      selector: (_, bloc) => bloc.getHomeScreenBookList,
                      builder: (context, bookList, child) {
                        int size = bookList?.length ?? 1;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height *
                              (0.37 * size),
                          child: const TabBarView(
                            children: [EBookPage(), AudioBookPage()],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
