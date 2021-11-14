import 'package:flutter/material.dart';
import 'package:untitled/logic/clothes.dart';
import 'package:untitled/logic/clothes_helper.dart';
import 'package:untitled/widgets/main_button.dart';
import 'dart:math';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _imageController = TextEditingController();
  late final TextEditingController _sizeController = TextEditingController();
  late final TextEditingController _priceController = TextEditingController();
  late final TextEditingController _descriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Color(0xff525252), Color(0xff3d72b4)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          title: const Center(
            child: Text(
              'Add Product',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, _) {
            return _mainBuilder();
          },
        ));
  }

  _mainBuilder() {
    return Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  TextField(
                    controller: _nameController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Please enter Name'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  TextField(
                    controller: _imageController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Please enter Image'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  TextField(
                    controller: _sizeController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Please enter Size'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Please enter Price'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  TextField(
                    controller: _descriptionController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: 'Please enter Description'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainButton(
                          action: () => Navigator.of(context).pop(),
                          text: 'BACK'),
                      MainButton(
                          action: () => {
                                Navigator.of(context).pushNamed('/'),
                                data.add(Clothes(
                                  id: Random().nextInt(1000000),
                                  name: _nameController.text,
                                  imageUrl: _imageController.text,
                                  size: _sizeController.text,
                                  price: double.tryParse(_priceController.text),
                                  description: _descriptionController.text,
                                )),
                              },
                          text: 'ADD'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
