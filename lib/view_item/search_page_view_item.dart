import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/bloc/search_page_bloc.dart';
import 'package:provider/provider.dart';

import '../page/detail_page.dart';
import '../page/search_page.dart';

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
              Center(child: Image.asset('images/book_place_holder.png')),
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

// class SearchBookListPage extends StatelessWidget {
//   const SearchBookListPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChangeNotifierProvider(
//         create: (context) => SearchPageBloc(),
//         child: Consumer<SearchPageBloc>(
//           builder: (context, bloc, child) => Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Stack(
//                 children: [
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextFormField(
//                         onChanged: (text) {
//                           final instance = context.read<SearchPageBloc>();
//                           instance.searchBookList(text);
//                         },
//                         autofocus: true,
//                         decoration: InputDecoration(
//                           hintText: 'Search Play Books',
//                           prefixIcon: GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Icon(
//                               Icons.arrow_back,
//                               color: Colors.black,
//                               size: 25,
//                             ),
//                           ),
//                           suffixIcon: const Icon(
//                             Icons.mic,
//                             color: Colors.black,
//                             size: 25,
//                           ),
//                         ),
//                       ),
//                       SearchMovieListTileViewItem(searchBookList: bloc.getSearchBookList,)
//                     ],
//                   ),
//                 ],
//               )
//           ),
//         ),
//       ),
//     );
//   }
// }
