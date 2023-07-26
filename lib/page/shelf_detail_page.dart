import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/bloc/library_page.dart';
import 'package:library_app/data/vos/book_hive_vo/book_hive_vo.dart';
import 'package:library_app/widget/easy_text_widget.dart';
import 'package:provider/provider.dart';
import '../constant/image_constant.dart';

class ShelfDetailPage extends StatelessWidget {
  const ShelfDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EasyText(text: '',color: Colors.black,fontWeight: FontWeight.w600,fontSize: 25,),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: const Row(
                children: [
                  Icon(Icons.sort),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Sort by Recent",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.apps)
                ],
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => LibraryPageBloc(),
              child: Selector<LibraryPageBloc,List<BookHiveVO>?>(
                selector: (_,bloc) => bloc.getBookHiveList,
                builder: (context, addToShelfBook, child) =>  Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                        itemCount: addToShelfBook?.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8, crossAxisCount: 2),
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.fill,
                                        imageUrl: "${addToShelfBook?[index].image}",
                                        errorWidget: (_, error, __) =>
                                        const Center(
                                          child: Icon(Icons.image),
                                        ),
                                        placeholder: (_, holder) =>
                                            Image.asset(kBookPlaceHolderImage),
                                      ))),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${addToShelfBook?[index].title}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}