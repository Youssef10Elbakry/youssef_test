import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
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
              onPressed: (context){},
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
            Text("Name", style: TextStyle(color: Colors.black, fontSize: 18),),
            Text("01111556545", style: TextStyle(color: Colors.grey, fontSize: 13)),
            Spacer(),
            Expanded(child: Divider(color: Colors.white, thickness: 2,))
          ],
        ),
      ),
    );
  }
}
