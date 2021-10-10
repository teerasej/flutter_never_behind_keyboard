import 'package:flutter/material.dart';

import '../neverhide/never_behind_keyboard_area.dart';
import '../neverhide/never_hide_bottom.dart';
import '../neverhide/never_hide_box.dart';

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
              height: 600,
            ),
            const Text('Course Name:'),
              Container(
              child: Column(
                children: [
                  NeverHideBox(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            "หลักสูตรอบรม Google Flutter 2 สำหรับผู้เริ่มต้น",
                      ),
                      focusNode: focusNode,
                    ),
                  ),
                  const SizedBox(
                      height: 70,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Hello'),
                  ),
                    NeverHideBottom(key: GlobalKey()),
                ],
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
