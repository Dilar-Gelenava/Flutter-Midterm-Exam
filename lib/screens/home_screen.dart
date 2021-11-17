import 'package:flutter/material.dart';
import 'package:untitled/logic/clothes_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              'Online Shop',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/add");
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, _) {
            return _mainBuilder();
          },
        ));
  }

  _mainBuilder() {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/details",
                    arguments: {"id": data[index].id}).then((_) {
                  setState(() {});
                });
              },
              onLongPress: () {
                Navigator.pushNamed(context, "/edit",
                    arguments: {"id": data[index].id}).then((_) {
                  setState(() {});
                });
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: GridTile(
                      footer: Column(children: [
                        Text(data[index].name),
                        Text('\$${data[index].price.toString()}'),
                      ]),
                      child: Column(
                        children: [
                          FadeInImage(
                            placeholder: const AssetImage(
                                "assets/images/clothes_placeholder.png"),
                            image: NetworkImage(
                              data[index].imageUrl,
                            ),
                            imageErrorBuilder: (context, obj, trace) {
                              return Image(
                                image: const AssetImage(
                                    'assets/images/clothes_placeholder.png'),
                                height: deviceWidth * 0.3,
                                width: deviceWidth * 0.3,
                              );
                            },
                            height: deviceWidth * 0.3,
                            width: deviceWidth * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ],
                      )),
                ),
              ));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
    );
  }
}
