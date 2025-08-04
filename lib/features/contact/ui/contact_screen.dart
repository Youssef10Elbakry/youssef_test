import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youssef_test/features/contact/ui/contact_textfield.dart';
import 'package:youssef_test/features/contact/ui/contact_widget.dart';

class ContactScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          ContactTextfield(controller: nameController, labelText: "Name",),
          SizedBox(height: 30,),
          ContactTextfield(controller: phoneController, labelText: "Phone Number",),
          saveButton(),
          Expanded(child: ListView.builder(itemCount: 5, itemBuilder: (context, index)=>ContactWidget(), ))
        ],
      ),
    );
  }

  Widget saveButton()=> TextButton(onPressed: (){}, child: Text("Save"));
}
