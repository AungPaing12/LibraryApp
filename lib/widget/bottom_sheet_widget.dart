import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/widget/easy_text_widget.dart';

import '../page/add_to_shelf_page.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.eBook,
      required this.onTap, required this.addToShelfOnTap})
      : super(key: key);
  final String imageURL;
  final String title;
  final bool eBook;
  final GestureTapCallback onTap;
  final GestureTapCallback addToShelfOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
          title: EasyText(
              text: title,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400),
          subtitle: Text((eBook == true) ? 'EBook' : 'AudioBook'),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: BottomSheetViewItem(
              icon: Icons.remove_circle,
              iconText: 'Remove download',
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: GestureDetector(
                onTap: onTap,
                child: const BottomSheetViewItem(
                  icon: Icons.delete,
                  iconText: 'Delete from library',
                ))),
         Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: GestureDetector(
              onTap: addToShelfOnTap,
              child: const BottomSheetViewItem(
                icon: Icons.add,
                iconText: 'Add to Shelf',
              ),
            )),
      ],
    );
  }
}

class BottomSheetViewItem extends StatelessWidget {
  const BottomSheetViewItem(
      {Key? key, required this.icon, required this.iconText})
      : super(key: key);
  final IconData icon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 25,
        ),
        EasyText(
          text: iconText,
          color: Colors.black,
          fontSize: 16,
        )
      ],
    );
  }
}
