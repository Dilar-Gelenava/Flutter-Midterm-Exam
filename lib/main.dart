import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/add_screen.dart';
import 'screens/edit_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
        '/add': (context) => const AddPage(),
        '/edit': (context) => const EditPage(),
      },
    );
  }
}
