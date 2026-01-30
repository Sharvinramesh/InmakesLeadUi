import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/leads_screens/widgets/icon_container.dart';

class StatusFollowupContainer extends StatelessWidget {
  final String title;
  const StatusFollowupContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top:15, left: 15, right: 15,),
            child: Container(
              padding:EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                        Text('Product name',style:TextStyle(fontSize:17,color:Colors.grey.shade500),)
                      ],
                    ),
                    heigt15,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 4,
                              bottom: 4,
                            ),
                            child: Text(
                              'Created on 18-10-2021',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        width10,
                        if (index < 1)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:orangeColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 4,
                                bottom: 4,
                              ),
                              child: Text(
                                'Partially Paid',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        width10,
                      ],
                    ),
                    heigt20,
                    Row(
                      children: [
                        LeadsIconContainer(
                          icon: FontAwesomeIcons.whatsapp,
                          containerColor: Colors.teal,
                        ),
                        width10,
                        LeadsIconContainer(
                          icon: Icons.phone_outlined,
                          containerColor:orangeColor,
                        ),
                        width10,
                        LeadsIconContainer(
                          icon: Icons.email_outlined,
                          containerColor: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
