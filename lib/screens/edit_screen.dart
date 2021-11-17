import 'package:flutter/material.dart';
import 'package:untitled/logic/clothes.dart';
import 'package:untitled/logic/clothes_helper.dart';
import 'package:untitled/widgets/main_button.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController _nameController;
  late TextEditingController _imageController;
  late TextEditingController _sizeController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;

  @override
  Widget build(BuildContext context) {
    Map _routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    var product = data.firstWhere((product) => product.id == _routeArgs['id']);

    _nameController = TextEditingController(text: product.name);
    _imageController = TextEditingController(text: product.imageUrl);
    _sizeController = TextEditingController(text: product.size);
    _priceController = TextEditingController(text: product.price.toString());
    _descriptionController = TextEditingController(text: product.description);

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
              'Edit Product',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, _) {
            return _mainBuilder(product);
          },
        ));
  }

  _mainBuilder(product) {
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
                                if (_nameController.text == "" ||
                                    _imageController.text == "" ||
                                    _sizeController.text == "" ||
                                    _priceController.text == "" ||
                                    _descriptionController.text == "")
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter valid data!'),
                                      ),
                                    )
                                  }
                                else
                                  {
                                    Navigator.of(context).pop(),
                                    data[data.indexOf(product)] = Clothes(
                                      id: product.id,
                                      name: _nameController.text,
                                      imageUrl: _imageController.text,
                                      size: _sizeController.text,
                                      price:
                                          double.parse(_priceController.text),
                                      description: _descriptionController.text,
                                    ),
                                  },
                              },
                          text: 'UPDATE'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
