import 'package:flutter/material.dart';

class Dialogs {
  /// Displays a loading dialog until the caller process is completed
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Please Wait',
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }

  /// Displays a yes/no dialog
  ///
  /// * the `title` param gives a title label for this dialog
  /// * the `message` param is used to display a message as a question to select yes or not
  static Future<bool> showYesNoDialog(
      {BuildContext context,
      GlobalKey key,
      String title,
      String message}) async {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            key: key,
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(title)
              ],
            ),
            titlePadding: EdgeInsets.only(left: 5, top: 10),
            content: SingleChildScrollView(
              child: Text(message),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
            ],
          );
        }).then((onValue) {
      if (onValue == null) return false;
      return onValue;
    });
  }

  /// Displays a showMessage dialog
  ///
  /// * the `scaffoldKey` param is a key related to the scaffold widget which invokes this dialog
  /// * the `message` param is the value that will be displayed by this dialog
  /// * the `color` param is the color that the dialog will use to be displayed
  static void showMessage(GlobalKey<ScaffoldState> scaffoldKey, String message,
      [MaterialColor color = Colors.red]) {
    scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
