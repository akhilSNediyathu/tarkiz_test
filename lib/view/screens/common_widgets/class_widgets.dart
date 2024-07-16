import 'package:driver_dxb/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    required this.controller,
    this.margin,
    this.keyboardType,
    this.obscureText = false,
    this.minlines,
    this.rightIcon,
    this.maxlines,
    this.validator,
  });

  final int? minlines;
  final int? maxlines;
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final Widget? rightIcon;
  final EdgeInsets? margin;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      controller: controller,
      minLines: minlines,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: const TextStyle(fontWeight: FontWeight.w500),
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border color
          borderRadius: kradius10,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border color
          borderRadius: kradius10,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border color
          borderRadius: kradius10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border color
          borderRadius: kradius10,
        ),
        filled: true,
        fillColor: Colors.grey[200], // Background color of the text field
        suffixIcon: rightIcon,
      ),
    );
  }
}

class CustomTextField2 extends StatefulWidget {
  const CustomTextField2({
    super.key,
    required this.hintText,
    this.icon,
    this.controller,
    this.margin,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final EdgeInsets? margin;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? const EdgeInsets.all(0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: isObsecure,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: IconButton(
            icon: Icon(
              isObsecure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isObsecure = !isObsecure;
              });
            },
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Remove border color
            borderRadius: kradius10,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none, // Remove border color
            borderRadius: kradius10,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none, // Remove border color
            borderRadius: kradius10,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none, // Remove border color
            borderRadius: kradius10,
          ),
          filled: true,
          fillColor: Colors.grey[200], // Background color of the text field
        ),
      ),
    );
  }
}
