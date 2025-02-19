import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;
  final Widget label;
  final Function? onEditingComplete;
  final Widget? prefixIcon;
  // final String aboveText;
  final Widget? suffixIcon;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.label,
    this.onEditingComplete,
    this.prefixIcon,
    // required this.aboveText,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      // Container for the email text on top the textfield
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label,
          const SizedBox(height: 3,),

          TextField(
            controller: controller,
            obscureText: obscureText,
            
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade200),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
            ),
              
          ),
        ],
      ),
    );
    
  }
}