import 'package:flutter/material.dart';

class ContactTextfield extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  ContactTextfield({super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth*0.95,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: labelText == "Name"? "Enter you name": "Enter your phone number",
          filled: true,
          fillColor: Colors.transparent,
          contentPadding:  EdgeInsets.symmetric(horizontal: screenWidth*0.0412, vertical: screenHeight*0.0187),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xF7989898),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF1F41BB), // Optional: blue when focused
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
