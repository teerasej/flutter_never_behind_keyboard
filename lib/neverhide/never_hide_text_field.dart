import 'package:flutter/material.dart';

extension NeverHideTextField on TextField {
  EdgeInsets get scrollPadding {
    return EdgeInsets.all(200);
  }
}
