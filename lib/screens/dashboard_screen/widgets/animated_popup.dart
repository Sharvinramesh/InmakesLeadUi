// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';

class NewLeadPopup extends StatelessWidget {
  const NewLeadPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 335,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: whiteColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset('images/dashboard/Vector 9.png'),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: blackColor.withOpacity(0.06),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(.08),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(Icons.task_alt_rounded, color: greenColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 285,
                  height: 100,
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 12),
                            child: Text(
                              "Congrats! New Lead\nReceived!",
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Text(
                              "Now let's convert it.",
                              style: TextStyle(fontSize: 14, color: whiteColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 70),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward, color: whiteColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
