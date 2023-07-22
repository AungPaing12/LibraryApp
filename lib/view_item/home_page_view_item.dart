import 'package:flutter/material.dart';
import '../page/search_page.dart';

class SearchPlayButtonContainer extends StatelessWidget {
  const SearchPlayButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.black38,
          ),
        ),
        child:  ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage(),));
          },
          leading: const Icon(Icons.search),title: const Text('Search Play Books',style: TextStyle(color: Colors.grey),),
          trailing: const Icon(Icons.person),),
      ),
    );
  }
}
