import 'package:flutter/material.dart';
import '../page/search_page.dart';
import '../widget/easy_text_widget.dart';

class SearchPlayButtonContainer extends StatelessWidget {
  const SearchPlayButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const SearchPage(),));
        },
        child: Container(
          width: 300,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),

          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10,right: 20),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
              const EasyText(
                text: 'Search Play Books',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 35,
                  height: 35,
                  color: Colors.grey,
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.network(
                        'https://animecorner.me/wp-content/uploads/2023/05/one-piece-luffy-birthday-2023.jpg',fit: BoxFit.fill,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
