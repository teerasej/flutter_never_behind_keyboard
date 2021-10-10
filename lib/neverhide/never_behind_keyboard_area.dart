import 'package:flutter/material.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_hide_bottom.dart';

class NeverBehindKeyboardArea extends StatefulWidget {
  final ScrollView scrollView;
  late NeverHideBottom bottom;
  late BuildContext _context;
  late bool widgetInFocus = false;

  NeverBehindKeyboardArea({Key? key, required this.scrollView})
      : super(key: key);

  @override
  _NeverBehindKeyboardAreaState createState() =>
      _NeverBehindKeyboardAreaState();
}

class _NeverBehindKeyboardAreaState extends State<NeverBehindKeyboardArea> {
  @override
  Widget build(BuildContext context) {
    // _context = context;

    // context.visitAncestorElements((element) {
    //   var parentWidget = element.widget;

    //   if (parentWidget is ListView ||
    //       // parentWidget is SingleChildScrollView ||
    //       parentWidget is ScrollView) {
    //     _theScroller = parentWidget as ScrollView;
    //     return false;
    //   }

    //   return true;
    // });

    return NotificationListener(
      onNotification: (Notification notification) {
        if (notification is ScrollEndNotification) {
          print('scroll end.');

          if (widget.widgetInFocus) {
            widget.widgetInFocus = false;
            _scrollToBottom();
          }
        }

        return true;
      },
      child: widget.scrollView,
    );
  }

  Future<void> _scrollToBottom() async {
    await Scrollable.ensureVisible(
      _getBottomContext(),
      alignment: 1,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    );
  }

  BuildContext _getBottomContext() {
    return (widget.bottom.key as GlobalKey).currentContext as BuildContext;
  }
}



// class _NeverBehindKeyboardAreaState extends State<NeverBehindKeyboardArea> {
//   // Widget _theScroller = Container();
//   GlobalKey key = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     // context.visitAncestorElements((element) {
//     //   var parentWidget = element.widget;

//     //   if (parentWidget is ListView ||
//     //       // parentWidget is SingleChildScrollView ||
//     //       parentWidget is ScrollView) {
//     //     _theScroller = parentWidget;
//     //     return false;
//     //   }

//     //   return true;
//     // });

//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return Container(
//           key: key,
//           child: widget.child,
//         );
//       },
//     );
//   }
// }
