import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormCard extends StatelessWidget {
  FormCard({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
