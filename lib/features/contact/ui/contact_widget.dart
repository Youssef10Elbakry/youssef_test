import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:youssef_test/features/contact/cubit/contact_cubit.dart';

class ContactWidget extends StatelessWidget {
  String name;
  String phoneNumber;
   ContactWidget({super.key, required this.name, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight*0.087,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(

        color: Colors.grey[300]
      ),

      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context){context.read<ContactCubit>().deleteContact(phoneNumber);},
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Column(
          children: [
            Spacer(),
            Text(name, style: TextStyle(color: Colors.black, fontSize: 18),),
            Text(phoneNumber, style: TextStyle(color: Colors.grey, fontSize: 13)),
            Spacer(),
            Expanded(child: Divider(color: Colors.white, thickness: 2,))
          ],
        ),
      ),
    );
  }
}
