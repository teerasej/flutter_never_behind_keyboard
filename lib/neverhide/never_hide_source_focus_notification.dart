import 'package:flutter/material.dart';

class NeverHideSourceNotification extends Notification {
  NeverHideSourceNotification(this.hasFocus);
  bool hasFocus = false;
}
