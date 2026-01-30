import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';

class IconCircle extends StatelessWidget {
 final Color? bgColor;
 final IconData circleIcon;
 final String titleText;
 final String subTitle;
 final double angle;
  const IconCircle({
    super.key,required this.bgColor, required this.circleIcon, required this.titleText, required this.subTitle, required this.angle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:bgColor,
            radius: 20,
            child: Transform.rotate(
              angle:angle,
              child: Icon(
                circleIcon,
                color:whiteColor,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[500],
                ),
              ),
              Text(subTitle,style:TextStyle(fontWeight:FontWeight.bold),),
            ],
          ),
        ],
      ),
    );
  }
}