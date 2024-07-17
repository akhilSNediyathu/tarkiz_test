// login_form.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:driver_dxb/utils/constants.dart';
import 'package:driver_dxb/utils/validations.dart';
import 'package:driver_dxb/view/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:driver_dxb/view/screens/common_widgets/class_widgets.dart';
import 'package:driver_dxb/view/screens/common_widgets/funtion_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
            email: emailController.text,
            password: passwordController.text,
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight20,
          const Text("Let's get started", style: loginStyle1),
          kheight,
          const Text('Fill this form to continue', style: loginStyle2),
          kheight50,
          _buildTextField(
            label: 'Email Address',
            hintText: 'example@gmail.com',
            controller: emailController,
            validator: validateEmail,
            icon: Icons.person,
          ),
          kheight20,
          _buildTextField2(
            label: 'Password',
            hintText: '******',
            controller: passwordController,
            validator: validatePassword,
            isPassword: true,
          ),
          kheight100,
          BlocBuilder<LoginBlocBloc, LoginBlocState>(
            builder: (context, state) {
              if (state is LoginBlocLoadingState) {
                return loadingButton(
                  media: media,
                  onPressed: () {},
                  color: mainColor,
                );
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
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    IconData? icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: hintStyle),
        kheight,
        CustomTextField(
          validator: validator,
          hintText: hintText,
          controller: controller,
          rightIcon: icon != null ? Icon(icon, color: grey) : null,
          obscureText: isPassword,
        ),
      ],
    );
  }

  Widget _buildTextField2({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: hintStyle),
        kheight,
        CustomTextField2(
          validator: validator,
          hintText: hintText,
          controller: controller,
        ),
      ],
    );
  }
}
