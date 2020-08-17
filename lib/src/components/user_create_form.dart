import 'package:flutter/material.dart';
import 'package:restaurant_finder/src/containers/view_models/user_view_models.dart';

class CreateUserForm extends StatefulWidget {
  final Function(UserViewModel userViewModel) onSave;

  CreateUserForm({Key key, this.onSave}) : super(key: key);

  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('test'),
    );
  }
}
