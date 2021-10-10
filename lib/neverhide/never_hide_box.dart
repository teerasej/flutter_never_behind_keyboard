import 'package:flutter/material.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_behind_keyboard_area.dart';

class NeverHideBox extends StatefulWidget {
  final Widget child;
  NeverHideBox({Key? key, required this.child}) : super(key: key);

  @override
  _NeverHideBoxState createState() => _NeverHideBoxState();
}

class _NeverHideBoxState extends State<NeverHideBox> {
  late NeverBehindKeyboardArea neverHideArea;

  @override
  Widget build(BuildContext context) {
    context.visitAncestorElements((element) {
      var parentWidget = element.widget;

      if (parentWidget is NeverBehindKeyboardArea) {
        neverHideArea = parentWidget;
        return false;
      }
      return true;
    });

    if (widget.child is TextField) {
      var textField = widget.child as TextField;
      textField.focusNode?.addListener(_onFocusChange);
    }

    return widget.child;
  }

  void _onFocusChange() {
    var textField = widget.child as TextField;
    if (textField.focusNode!.hasFocus) {
      neverHideArea.widgetInFocus = true;
    }
  }
}
