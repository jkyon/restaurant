import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DecoratedCardItem extends StatelessWidget {
  final Widget cardContent;

  final double cardElevation;

  final EdgeInsetsGeometry cardMargin;

  final Color cardColorDecoration;

  DecoratedCardItem({
    Key key,
    @required this.cardContent,
    this.cardElevation,
    this.cardMargin,
    this.cardColorDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardElevation != null ? cardElevation : null,
      margin: cardMargin != null ? cardMargin : null,
      child: Container(
        decoration: cardColorDecoration != null
            ? BoxDecoration(color: cardColorDecoration)
            : null,
        child: cardContent,
      ),
    );
  }
}
