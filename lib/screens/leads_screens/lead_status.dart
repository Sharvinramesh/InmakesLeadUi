import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';

class BottomModalSheet extends StatelessWidget {
  const BottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 358,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:10,top:10),
            child: Text(
              'Choose Status',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            title: Text(
              'Phone Switched off',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize:19),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Didn't pick up",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Success",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Option 4",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}
