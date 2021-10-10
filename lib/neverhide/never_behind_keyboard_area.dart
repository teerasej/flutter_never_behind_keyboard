import 'package:flutter/material.dart';
import 'package:flutter_never_behind_keyboard/neverhide/never_hide_bottom.dart';

class NeverBehindKeyboardArea extends StatelessWidget {
  final Widget child;
  late NeverHideBottom bottom;
  late BuildContext _context;
  late ScrollView _theScroller = ListView();

  NeverBehindKeyboardArea({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;

    context.visitAncestorElements((element) {
      var parentWidget = element.widget;

      if (parentWidget is ListView ||
          // parentWidget is SingleChildScrollView ||
          parentWidget is ScrollView) {
        _theScroller = parentWidget as ScrollView;
        return false;
      }

      return true;
    });

    return child;
  }

  void scrollToBottom() {
    var scrollController = _theScroller.controller;
    // scrollController?.position.ensureVisible(
    //   _getBottomContext().findRenderObject() as RenderObject,
    //   alignment: 0.5,
    //   duration: const Duration(seconds: 2),
    // );

    // MediaQuery.of(_getBottomContext()).

    RenderBox neverHideBottomBox =
        _getBottomContext().findRenderObject() as RenderBox;
    final positionRed = neverHideBottomBox.localToGlobal(Offset.zero);
    print("POSITION of Red: $positionRed ");

    scrollController?.animateTo(
      positionRed.dy,
      duration: Duration(seconds: 2),
      curve: Curves.ease,
    );
  }

  void focusToBottom() {
    // BuildContext currentContext = _getBottomContext()
    Scrollable.ensureVisible(
      _context,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    );
  }

  BuildContext _getBottomContext() {
    return (bottom.key as GlobalKey).currentContext as BuildContext;
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
