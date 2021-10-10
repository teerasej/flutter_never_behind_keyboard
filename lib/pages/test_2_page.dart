import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Test2Page extends StatefulWidget {
  Test2Page({Key? key}) : super(key: key);

  @override
  _Test2PageState createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  FocusNode focusNode = FocusNode();
  GlobalKey key = GlobalKey();
  GlobalKey listViewKey = GlobalKey();

  bool _textFieldFocused = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    focusNode.addListener(prepareScroll);

    // TODO: implement initState
    super.initState();
  }

  void prepareScroll() async {
    if (focusNode.hasFocus) {
      setState(() {
        _textFieldFocused = true;
      });
    } else {
      setState(() {
        _textFieldFocused = false;
      });
    }
  }

  scrollNow() async {
    await Scrollable.ensureVisible(
      key.currentContext as BuildContext,
      alignment: 1,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    );

    // setState(() {
    //   _textFieldFocused = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance?.addPostFrameCallback((_) => scrollNow());
    if (_textFieldFocused) {
      SchedulerBinding.instance?.addPostFrameCallback((_) => scrollNow());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Never Hide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          key: listViewKey,
          controller: scrollController,
          children: [
            const SizedBox(
              height: 600,
            ),
            const Text('Course Name:'),
            Container(
              color: Colors.yellow,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "test page",
                    ),
                    focusNode: focusNode,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    key: key,
                    onPressed: () {},
                    child: const Text('Hello'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await scrollNow();
        },
      ),
    );
  }

  @override
  void dispose() {
    focusNode.removeListener(prepareScroll);
    // TODO: implement dispose
    focusNode.dispose();
    super.dispose();
  }
}
