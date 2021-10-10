import 'package:flutter/material.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_behind_keyboard_area.dart';

class NeverHideBottom extends StatelessWidget {
  const NeverHideBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.visitAncestorElements((element) {
      var parentWidget = element.widget;

      if (parentWidget is NeverBehindKeyboardArea) {
        parentWidget.bottom = this;
        return false;
      }

      return true;
    });

    return Container();
  }
}
