import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tasbih/Utils/timeerclass.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Splashervices _splahservices = Splashervices();
  @override
  void initState() {
    super.initState();
    _splahservices.splash(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 72, 121),
      body: Container(
        child: Center(child: Image.asset("assets/images/tasbih_logo.png")),
      ),
    );
  }
}
