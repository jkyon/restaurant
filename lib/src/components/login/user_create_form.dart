import 'package:flutter/material.dart';
import 'package:restaurant_finder/src/components/widgets/form_card.dart';
import 'package:restaurant_finder/src/components/widgets/input_text_form_field.dart';
import 'package:restaurant_finder/src/containers/view_models/user_view_models.dart';

import '../widgets/dialogs.dart';
import '../widgets/row_raised_button.dart';

class CreateUserForm extends StatefulWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Function(UserViewModel userViewModel) onSave;

  CreateUserForm({Key key, this.onSave}) : super(key: key);

  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  UserViewModel _viewModel = UserViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Form(
              key: CreateUserForm._formKey,
              child: FormCard(children: [
                SizedBox(height: 10),
                InputTextFormField(
                  // key: CreateUserForm._userKey,
                  // currentText: "",
                  fieldLabelText: 'Name',
                  inputType: TextInputType.text,
                  messageForEmptyField: 'field is required',
                  onSave: (v) => _viewModel.name = v,
                ),
                SizedBox(height: 10),
                InputTextFormField(
                  // key: CreateUserForm._userKey,
                  // currentText: "",
                  fieldLabelText: 'User Name',
                  inputType: TextInputType.text,
                  messageForEmptyField: 'field is required',
                  onSave: (v) => _viewModel.userName = v,
                ),
                SizedBox(height: 10),
                InputTextFormField(
                  // key: CreateUserForm._userKey,
                  // currentText: "",
                  fieldLabelText: 'Password',
                  inputType: TextInputType.text,
                  isPasswordField: true,
                  messageForEmptyField: 'field is required',
                  onSave: (v) => _viewModel.password = v,
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            RowRaisedButton(
                mainAxisAlignment: MainAxisAlignment.center,
                buttonHeight: 40,
                buttonMinWidth: 300,
                text: 'Create',
                onPressed: _submitForm),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final FormState form = CreateUserForm._formKey.currentState;

    if (!form.validate()) {
      Dialogs.showMessage(_scaffoldKey, 'Error in form');
      return;
    }

    form.save();
    widget.onSave(_viewModel);
  }
}
