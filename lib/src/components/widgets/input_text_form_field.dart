import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputTextFormField extends StatefulWidget {
  final String currentText;

  final TextInputType inputType;

  final String regExPattern;

  final String messageForEmptyField;

  final String messageForMismatchPattern;

  final String fieldLabelText;

  final int fieldLenghAllowed;

  final TextEditingController controller;

  final bool isPasswordField;

  final Function(String) onSave;

  InputTextFormField(
      {Key key,
      this.currentText,
      this.inputType,
      this.regExPattern,
      this.messageForEmptyField,
      this.messageForMismatchPattern,
      this.fieldLabelText,
      this.fieldLenghAllowed,
      this.controller,
      this.isPasswordField = false,
      this.onSave})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _InputTextFormFieldState();
}

class _InputTextFormFieldState extends State<InputTextFormField> {
  TextEditingController _resetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _resetController = widget.controller != null
        ? widget.controller
        : new TextEditingController(text: widget.currentText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.fieldLenghAllowed,
      decoration: new InputDecoration(labelText: widget.fieldLabelText),
      keyboardType: widget.inputType,
      controller: _resetController,
      validator: _fieldValidation,
      obscureText: widget.isPasswordField,
      onSaved: widget.onSave,
    );
  }

  String _fieldValidation(String value) {
    var pattern = widget.regExPattern;

    if (value.length == 0) {
      return widget.messageForEmptyField;
    } else if (pattern != null && pattern.isNotEmpty) {
      RegExp regExp = new RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return widget.messageForMismatchPattern.isEmpty
            ? "Pattern does not match"
            : widget.messageForMismatchPattern;
      }
      return null;
    } else {
      return null;
    }
  }
}
