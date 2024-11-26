import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
    final IconData? suffixcon;
  final Color fillColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focus;
 final void Function()? onPressedbutton;
  final void Function(String)? onChanged;

  const CustomSearchField({
    this.suffixcon,
    this.onPressedbutton,
    super.key,
    this.focus,
    required this.hintText,
    this.prefixIcon = Icons.search,
    required this.fillColor,
    this.controller,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
      
        focusNode:focus ,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon:IconButton(onPressed: onPressedbutton, icon: Icon(suffixcon)),
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 214, 214, 214),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 214, 214, 214),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 214, 214, 214),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 214, 214, 214),
            ),
          ),
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
