import 'package:flutter/material.dart';

import '../widgets/form_card.dart';
import '../widgets/input_text_form_field.dart';

class LoginView extends StatefulWidget {
  final String error;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final ValueKey _userKey = new Key("userKey");
  static final ValueKey _passwordKey = new Key("passwordKey");

  final Function(String userName, String password, BuildContext context)
      onLoginPressed;

  final Function() onCreateUser;

  LoginView({Key key, this.error, this.onLoginPressed, this.onCreateUser})
      : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _userController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.error.isNotEmpty) {
      displaySnack(context).then((success) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 3000),
            backgroundColor: Colors.redAccent,
            content: Text(widget.error),
          ),
        );
      });
    }

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Form(
                key: LoginView._formKey,
                child: FormCard(children: <Widget>[
                  SizedBox(height: 20),
                  InputTextFormField(
                    controller: _userController,
                    key: LoginView._userKey,
                    currentText: "",
                    fieldLabelText: 'User Name',
                    inputType: TextInputType.text,
                    messageForEmptyField: 'Field is required',
                  ),
                  SizedBox(height: 2),
                  InputTextFormField(
                    controller: _passwordController,
                    key: LoginView._passwordKey,
                    currentText: "",
                    fieldLabelText: 'Password',
                    inputType: TextInputType.text,
                    messageForEmptyField: 'Field is required',
                    isPasswordField: true,
                  ),
                  SizedBox(height: 5),
                ])),
            ButtonBarTheme(
              data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  _loginButton(context),
                ],
              ),
            ),
            ButtonBarTheme(
              data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  _createUser(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton(context) {
    return ButtonTheme(
      minWidth: 300,
      height: 40,
      child: RaisedButton(
        shape: Theme.of(context).buttonTheme.shape,
        textColor: Theme.of(context).primaryTextTheme.button.color,
        elevation: 8,
        child: Text('Login'),
        onPressed: () async {
          if (!LoginView._formKey.currentState.validate()) {
            return;
          }
          widget.onLoginPressed(
              _userController.text, _passwordController.text, context);
        },
      ),
    );
  }

  Widget _createUser() {
    return ButtonTheme(
      minWidth: 300,
      height: 40,
      child: RaisedButton(
        shape: Theme.of(context).buttonTheme.shape,
        textColor: Theme.of(context).primaryTextTheme.button.color,
        elevation: 8,
        child: Text('Create New User'),
        onPressed: () async {
          widget.onCreateUser();
        },
      ),
    );
  }

  Future<bool> displaySnack(BuildContext context) async {
    return true;
  }
}
