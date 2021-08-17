import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final int counter;
  Page3(this.counter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [Text("$counter")],
      ),
    );
  }
}
