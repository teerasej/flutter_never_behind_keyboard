import 'package:flutter/material.dart';
import 'package:never_behind_keyboard/never_behind_keyboard.dart';

class NeverHidePage extends StatefulWidget {
  NeverHidePage({Key? key}) : super(key: key);

  @override
  _NeverHidePageState createState() => _NeverHidePageState();
}

class _NeverHidePageState extends State<NeverHidePage> {
  FocusNode focusNode = FocusNode();
  GlobalKey key = GlobalKey();

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Never Hide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeverBehindKeyboardArea(
          scrollView: ListView(
            controller: scrollController,
            children: [
              const SizedBox(
                height: 400,
              ),
              const Text('Course Name:'),
              Column(
                children: [
                  NeverBehindFocusSource(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "ex. Google Flutter 2 for beginner",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('How many trainee in this course?'),
                        TextField(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Hello'),
                  ),
                  NeverBehindBottom(key: GlobalKey()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
