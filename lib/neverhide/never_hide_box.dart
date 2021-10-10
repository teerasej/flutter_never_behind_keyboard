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

  // focus after rendered
  // @override
  // void initState() {
  //   //... your stuff

  //   WidgetsBinding.instance?.addPostFrameCallback(_onLayoutDone);
  //   super.initState();
  // }

  // _onLayoutDone(_) {
  //   FocusScope.of(context).requestFocus((widget.child as TextField).focusNode);
  // }

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

    if (widget.child is TextField || widget.child is TextFormField) {
      if (widget.child is TextField) {
        var textField = widget.child as TextField;
        textField.focusNode?.addListener(_onFocusChange);
        //textField.scrollPadding = EdgeInsets.all(100);
      }
    }

    return Container(
      child: widget.child,
    );
  }

  void _onFocusChange() {
    if (widget.child is TextField) {
      var textField = widget.child as TextField;
      if (textField.focusNode!.hasFocus) {
        // neverHideArea.focusToBottom();
        neverHideArea.scrollToBottom();
      }
    }

    // BuildContext currentContext =
    //     (neverHideArea.key as GlobalKey).currentContext as BuildContext;
    // Scrollable.ensureVisible(currentContext,
    //     alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    //     alignment: 20);
  }
}
