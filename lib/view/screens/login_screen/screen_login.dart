// screen_login.dart
import 'package:driver_dxb/utils/constants.dart';
import 'package:driver_dxb/view/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:driver_dxb/view/screens/common_widgets/funtion_widgets.dart';
import 'package:driver_dxb/view/screens/login_screen/widgets.dart';
import 'package:driver_dxb/view/screens/main_screen.dart/screen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mainColor,
      body: BlocConsumer<LoginBlocBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is LoginBlocSuccesState) {
            customSnackbar(context, 'Welcome back', green);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(model: state.driver)),
              (route) => false,
            );
          } else if (state is LoginBlocErrorState) {
            customSnackbar(context, state.error, red);
          }
        },
        builder: (context, state) {
          return Container(
            height: media.height,
            width: media.width,
            margin: const EdgeInsets.only(top: 130),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: LoginForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
