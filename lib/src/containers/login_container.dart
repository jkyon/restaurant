import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_finder/src/blocs/login/login_bloc.dart';
import 'package:restaurant_finder/src/components/login_view.dart';
import 'package:restaurant_finder/src/components/user_create_form.dart';
import 'package:restaurant_finder/src/components/widgets/Simple_progress_indicator.dart';
import 'package:restaurant_finder/src/containers/view_models/user_view_models.dart';
import 'package:restaurant_finder/src/ioc/base_module.dart';
import 'package:restaurant_finder/src/models/models.dart';

class LoginContainer extends StatefulWidget {
  LoginContainer({Key key}) : super(key: key);

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  LoginBloc _loginBloc = MobileContainer().get<LoginBloc>();
  Completer<void> _refreshCompleter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is InitialCreatingUserState) {
          _loginBloc..add(InitCreateUserEvent());
          return CreateUserForm(
            onSave: (UserViewModel viewModel) {
              _loginBloc
                ..add(CreateUserEvent(
                    user: User(
                  name: viewModel.name,
                  password: viewModel.password,
                  userName: viewModel.password,
                )));
            },
          );
        }
        if (state is CreatingUserState) {
          return SimpleProgressIndicator();
        }
        if (state is SuccessCreateUserState) {
          return LoginView();
        }
        if (state is FailedCreateUserState) {
          return LoginView();
        }
        if (state is LoginUserProcess) {
          return SimpleProgressIndicator();
        }
        if (state is LoginSuccess) {
          return LoginView();
        } else {
          return LoginView();
        }
      },
    );
  }
}
