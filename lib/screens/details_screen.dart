import 'package:flutter/material.dart';
import 'package:untitled/logic/clothes_helper.dart';
import 'package:untitled/widgets/main_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  _deleteProduct(id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("are you sure?"),
            content: Wrap(
              children: [
                MainButton(
                    action: () {
                      data.removeWhere((product) => product.id == id);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    text: "yes"),
                MainButton(
                    action: () => Navigator.of(context).pop(), text: "no"),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Map _routeArgs = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'delete product',
              onPressed: () {
                _deleteProduct(_routeArgs['id']);
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Color(0xff525252), Color(0xff3d72b4)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, _) {
            return _mainBuilder(_routeArgs);
          },
        ));
  }

  _mainBuilder(_routeArgs) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var product = data.firstWhere((product) => product.id == _routeArgs['id']);

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color(0xff3f2b96),
          Color(0xffa8c0ff),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: FadeInImage(
                  placeholder:
                      const AssetImage("assets/images/clothes_placeholder.png"),
                  image: NetworkImage(product.imageUrl),
                  imageErrorBuilder: (context, obj, trace) {
                    return Image(
                      image: const AssetImage(
                          'assets/images/clothes_placeholder.png'),
                      height: deviceWidth * 0.9,
                      width: deviceWidth * 0.9,
                    );
                  },
                  height: deviceWidth * 0.9,
                  width: deviceWidth * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Name:',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Price:',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Size:',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            product.size,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
