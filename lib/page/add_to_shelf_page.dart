import 'package:flutter/material.dart';
import 'package:library_app/constant/image_constant.dart';
import 'package:library_app/page/shelf_detail_page.dart';
import '../constant/hive_constant.dart';
import '../widget/easy_text_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
class AddToShelfPage extends StatefulWidget {
  const AddToShelfPage({Key? key}) : super(key: key);

  @override
  State<AddToShelfPage> createState() => _AddToShelfPageState();
}

class _AddToShelfPageState extends State<AddToShelfPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _items = [];
  final _shelfBox = Hive.box(kBoxNameForShelf);

  @override
  void initState() {
    _refreshItem();
    super.initState();
  }

  void _refreshItem() {
    final data = _shelfBox.keys.map((key) {
      final item = _shelfBox.get(key);
      return {"key": key, "name": item['name'], 'quantity': item['quantity']};
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shelfBox.add(newItem);
    _refreshItem();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
           Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              const EasyText(
                text: 'Add To Shelf',
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(itemCount: _items.length,itemBuilder: (context, index) {
             final currentItem = _items[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.all(10),
                elevation: 3,
                child: ListTile(
                  onTap: (){
                    final tapValue = _items[index].values.toString();
                    
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShelfDetailPage(),));
                  },
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        kShelfPlaceHolderImage,width: 80,height: 50,
                        fit: BoxFit.cover,
                      )),
                  title: Text(currentItem['name']),
                  subtitle: const Text('book'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded)
                ),
              );
            },),
          ),
          Visibility(
              visible: (_items.isEmpty) ? true : false,
              child: const Expanded(
                  flex: 4,
                  child: ShelfPlaceHolderViewItem())),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>  AlertDialog(
                        title: const EasyText(text: 'Crate New Shelf',color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600,),
                        actions: [
                            TextField(
                            decoration: const InputDecoration(
                                hintText: 'Enter shelf name',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                )),controller: _controller,
                             autofocus: true,
                          ),
                          TextButton(onPressed: (){
                            _createItem({
                              'name' : _controller.text
                            });
                            _controller.text = '';
                            Navigator.of(context).pop();
                          }, child: const EasyText(text: 'SUBMIT',color: Colors.blue,))
                        ],
                      ),
                    );
                  },
                  color: Colors.blue,
                  padding: const EdgeInsets.all(10),
                  highlightColor: Colors.cyanAccent,
                  child: const SizedBox(
                    width: 120,
                    height: 30,
                    child:  Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 5,right: 5),
                            child: Icon(Icons.edit,color: Colors.white,size: 20,)),
                         EasyText(
                            text: 'Add to new', color: Colors.white, fontSize: 14),
                      ],
                    ),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShelfPlaceHolderViewItem extends StatelessWidget {
  const ShelfPlaceHolderViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'images/shelf.png',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        const Align(
          alignment: Alignment.center,
          child: EasyText(
            text: 'There is no shelves right now . Create one',
            color: Colors.black,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
