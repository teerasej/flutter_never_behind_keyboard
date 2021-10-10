import 'package:flutter/material.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_behind_keyboard_area.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_hide_bottom.dart';
import 'package:flutter_never_behind_keyboard/pages/never_hide_page.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_hide_text_field.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_hide_box.dart';
import 'package:flutter_never_behind_keyboard/pages/test_2_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return NeverHidePage();
    // return Test2Page();
  }
}
