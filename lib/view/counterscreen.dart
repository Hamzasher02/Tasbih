import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _counter = prefs.getInt("counter") ?? 0;
    int newCounter = _counter + 1;
    prefs.setInt('counter', newCounter);
    setState(() {
      _counter = newCounter;
    });
  }

  void _resetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', 0);
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 34, 172),
        toolbarHeight: 10,
      ),
      body: Stack(children: [
        Container(
          color: const Color.fromARGB(255, 38, 60, 97),
        ),
        Positioned(
          left: 50,
          top: 150,
          child: Container(
            height: 340,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    width: 10,
                    color: const Color.fromARGB(183, 255, 255, 255))),
          ),
        ),
        Positioned(
          left: 80,
          top: 185,
          child: Container(
            height: 110,
            width: 240,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 229, 236, 241),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(width: 10, color: Colors.black)),
            child: Center(
              child: Text(
                "$_counter",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 100,
          top: 325,
          child: GestureDetector(
            onTap: _incrementCounter,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 236, 241),
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(width: 5, color: Colors.white)),
            ),
          ),
        ),
        Positioned(
          left: 230,
          top: 340,
          child: GestureDetector(
            onTap: _resetCounter,
            child: Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 236, 241),
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(width: 5, color: Colors.white)),
            ),
          ),
        ),
        const Positioned(
            left: 245,
            top: 383,
            child: Text(
              'reset',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
        const Positioned(
            left: 130,
            top: 450,
            child: Text(
              'COUNT',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ))
      ]),
    );
  }
}
