import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant/image_constant.dart';
import '../page/detail_page.dart';


class SearchListTileViewItem extends StatelessWidget {
  const SearchListTileViewItem(
      {Key? key,
      required this.imageURL,
      required this.bookTitle,
      required this.eBook})
      : super(key: key);
  final String imageURL;
  final String bookTitle;
  final bool eBook;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 0, right: 10),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BookDetailPage()));
        },
        leading: CachedNetworkImage(
          imageUrl: imageURL,
          fit: BoxFit.fill,
          width: 55,
          height: 55,
          placeholder: (context, url) =>
              Image.asset('images/tmdb_place_holder.png'),
          errorWidget: (context, url, error) =>
              Center(child: Image.asset(kBookPlaceHolderImage)),
        ),
        title: Text(
          bookTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        subtitle: Text(
          (eBook == true) ? 'EBook' : 'AudioBook',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
