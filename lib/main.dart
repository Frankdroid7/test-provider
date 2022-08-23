import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/home.dart';
import 'package:test_provider/providers/card_properties_provider.dart';
import 'package:test_provider/providers/todo_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CardProperties()),
      ChangeNotifierProvider(create: (context) => TodoProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
