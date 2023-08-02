import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasbih/view/counterscreen.dart';

class Splashervices {
  void splash(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CounterScreen())));
  }
}
