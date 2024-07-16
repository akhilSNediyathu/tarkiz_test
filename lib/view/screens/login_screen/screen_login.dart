import 'package:driver_dxb/utils/constants.dart';
import 'package:driver_dxb/utils/validations.dart';
import 'package:driver_dxb/view/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:driver_dxb/view/screens/common_widgets/class_widgets.dart';
import 'package:driver_dxb/view/screens/common_widgets/funtion_widgets.dart';
import 'package:driver_dxb/view/screens/main_screen.dart/screen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBlocBloc>().add(OnLoginButtonClickEvent(
          email: emailController.text, password: passwordController.text));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: BlocConsumer<LoginBlocBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is LoginBlocSuccesState) {
            customSnackbar(context, 'welcome back', green);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return  HomeScreen(model: state.driver);
              }),
              (Route<dynamic> route) => false,
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey, // Assign the GlobalKey to the Form widget
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kheight20,
                      const Text("Let's get started", style: loginStyle1),
                      kheight,
                      const Text(
                        'Fill this form to continue',
                        style: loginStyle2,
                      ),
                      kheight50,
                      const Text(
                        'Email Address',
                        style: hintStyle,
                      ),
                      kheight,
                      CustomTextField(
                        validator: validateEmail,
                        hintText: 'example@gmail.com',
                        controller: emailController,
                        rightIcon: const Icon(
                          Icons.person,
                          color: grey,
                        ),
                      ),
                      kheight20,
                      const Text(
                        'Password',
                        style: hintStyle,
                      ),
                      kheight,
                      CustomTextField2(
                        validator: validatePassword,
                        hintText: '******',
                        controller: passwordController,
                        margin: EdgeInsets.zero,
                      ),
                      kheight100,
                      BlocBuilder<LoginBlocBloc, LoginBlocState>(
                        builder: (context, state) {
                          if (state is LoginBlocLoadingState) {
                            return loadingButton(
                                media: media,
                                onPressed: () {},
                                color: mainColor);
                          }
                          return customButton(
                            media: media,
                            buttonText: 'Login',
                            onPressed: _validateForm,
                            color: mainColor,
                          );
                        },
                      ),
                      kheight20,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
