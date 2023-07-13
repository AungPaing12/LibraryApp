import 'package:flutter/material.dart';

import '../widget/book_title_image_scroll.dart';

class EBookPage extends StatelessWidget {
  const EBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      scrollDirection: Axis.vertical,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
       children: [
         BookTitleImageScroll(),
         BookTitleImageScroll(),
         BookTitleImageScroll(),
       ],
     ),
    );
  }
}
