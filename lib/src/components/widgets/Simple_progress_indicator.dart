import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: new CircularProgressIndicator()),
      ],
    ));
  }
}
