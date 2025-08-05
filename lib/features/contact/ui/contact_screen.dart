import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youssef_test/features/contact/cubit/contact_cubit.dart';
import 'package:youssef_test/features/contact/cubit/contact_state.dart';
import 'package:youssef_test/features/contact/ui/contact_textfield.dart';
import 'package:youssef_test/features/contact/ui/contact_widget.dart';

class ContactScreen extends StatefulWidget {

  ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  void initState(){
    super.initState();
    context.read<ContactCubit>().getContacts();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: screenHeight*0.0622,),
          ContactTextfield(controller: nameController, labelText: "Name",),
          SizedBox(height: screenHeight*0.0373,),
          ContactTextfield(controller: phoneController, labelText: "Phone Number",),
          TextButton(onPressed: (){context.read<ContactCubit>().saveContact(nameController.text, "000${phoneController.text}");}, child: Text("Save")),
          BlocConsumer<ContactCubit, ContactState>(builder: (context, state){
            if(state is ContactLoaded){
              return Expanded(child: ListView.builder(itemCount: state.contacts.length, itemBuilder: (context, index)=>ContactWidget(name: state.contacts[index].name, phoneNumber: state.contacts[index].phone)));
          }
            else if(state is ContactEmpty){
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Spacer(),
                    Icon(Icons.hourglass_empty, color: Colors.grey,),
                    Center(child: Text("No Contacts Available", style: TextStyle(color: Colors.grey, fontSize: 15),)),

                    Spacer()
                  ],
                ),
              );
            }
          else{
            return CircularProgressIndicator();
            }
          }, listener: (BuildContext context, ContactState state) {
            if(state is ContactSaved){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 4),
                ),
              );
            }
            else if(state is ContactDeleted){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Contact Deleted Successfully"),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 4),
                ),
              );
            }
            else if(state is ContactError){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 4),
                ),
              );
            }
          },),
        ],
      ),
    );
  }

  Widget saveButton()=> TextButton(onPressed: (){}, child: Text("Save"));
}
