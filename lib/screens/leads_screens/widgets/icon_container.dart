import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';

class LeadsIconContainer extends StatelessWidget {
 final IconData icon;
 final Color containerColor;
  const LeadsIconContainer({
    super.key, required this.icon, required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color:containerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color:whiteColor
      ),
    );
  }
}