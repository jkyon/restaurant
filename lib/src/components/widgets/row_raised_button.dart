import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowRaisedButton extends StatelessWidget {
  final double buttonHeight;

  final double buttonMinWidth;

  final MainAxisAlignment mainAxisAlignment;

  final String text;

  final VoidCallback onPressed;

  RowRaisedButton(
      {Key key,
      this.mainAxisAlignment,
      this.text,
      this.onPressed,
      this.buttonHeight,
      this.buttonMinWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        ButtonTheme(
            textTheme: ButtonTextTheme.primary,
            height: buttonHeight, //36
            minWidth: buttonMinWidth, //88
            child: RaisedButton(
              shape: Theme.of(context).buttonTheme.shape,
              child: new Text(text),
              onPressed: onPressed,
              elevation: 8.0,
            ))
      ],
    );
  }
}
