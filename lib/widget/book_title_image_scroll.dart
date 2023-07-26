import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/data/model/library_model.dart';
import 'package:library_app/data/model/library_model_impl.dart';
import 'package:library_app/widget/easy_text_widget.dart';
import 'package:provider/provider.dart';
import '../data/vos/book_vo/book_vo.dart';
import '../page/add_to_shelf_page.dart';
import '../page/detail_page.dart';
import 'bottom_sheet_widget.dart';

final LibraryModel _libraryModel = LibraryModelImpl();

class BookTitleImageScroll extends StatefulWidget {
  const BookTitleImageScroll({
    Key? key,
    required this.bookVO,
    required this.bookListTitle,
  }) : super(key: key);
  final List<BooksVO>? bookVO;
  final String bookListTitle;

  @override
  State<BookTitleImageScroll> createState() => _BookTitleImageScrollState();
}

class _BookTitleImageScrollState extends State<BookTitleImageScroll> {
  List<BooksVO> books = [];

  @override
  void initState() {
    books = widget.bookVO!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageBloc(),
      child: Consumer<HomePageBloc>(
        builder: (context, bloc, child) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: EasyText(
                      text: widget.bookListTitle,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return BookTitleImageScrollItemView(
                          imageURL: books[index].bookImage ?? '',
                          bookTitle: books[index].title ?? '',
                          booksVO: books[index],
                          onTap: (bookVO) {
                            books = books.map((e) {
                              if (e == bookVO) {
                                e.isSelected = true;
                              }
                              if (e.isSelected == true) {
                                e.isSelected = false;
                              }
                              return e;
                            }).toList();
                            bloc.saveBookHive(bookVO);
                            print('book name=======>${bookVO.title}');
                          },
                          deleteOnTap: (bookVO) {
                            bloc.deleteFromHive(bookVO);
                          },
                          tap: (bookVO) {
                            bloc.saveBookHive(bookVO);
                          },
                          addToShelfOnTap: (bookVO) {
                            bloc.saveBookHive(bookVO);
                          },
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

class BookTitleImageScrollItemView extends StatelessWidget {
  const BookTitleImageScrollItemView({
    Key? key,
    required this.imageURL,
    required this.bookTitle,
    required this.booksVO,
    required this.onTap,
    required this.deleteOnTap,
    required this.tap,
    required this.addToShelfOnTap,
  }) : super(key: key);
  final String imageURL;
  final String bookTitle;
  final BooksVO booksVO;
  final Function(BooksVO) onTap;
  final Function(BooksVO) deleteOnTap;
  final Function(BooksVO) tap;
  final Function(BooksVO) addToShelfOnTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 25),
                  child: SizedBox(
                    width: 170,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        onTap: () {
                          tap(booksVO);
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
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 70, top: 25),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              onTap(booksVO);
                            },
                            child: Icon(
                              Icons.favorite,
                              color: (booksVO.isSelected)
                                  ? Colors.grey
                                  : Colors.red,
                              size: 25,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
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
                                    return SizedBox(
                                        height: 250,
                                        child: BottomSheetWidget(
                                          title: bookTitle,
                                          imageURL: imageURL,
                                          eBook: true,
                                          onTap: () {
                                            deleteOnTap(booksVO);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: EasyText(
                                                        text:
                                                            '${booksVO.title ?? ''} has benn deleted from your book')));
                                          },
                                          addToShelfOnTap: () {
                                            addToShelfOnTap(booksVO);
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddToShelfPage(),
                                            ));
                                          },
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
            child: SizedBox(
              width: 150,
              height: 20,
              child: EasyText(
                text: bookTitle,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
