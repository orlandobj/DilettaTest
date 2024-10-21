import 'package:flutter/material.dart';

class Nav {
  BuildContext context;

  Nav(this.context);
  void push({required Widget page}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  void pushReplacement({required Widget page}) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  void pop() {
    Navigator.of(context).pop();
  }
}
