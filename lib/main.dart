import 'package:flutter/material.dart';
import 'package:indosiana/app/pages/article_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS MOBILE PROGRAMMING',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArticlePage(),
    );
  }
}
