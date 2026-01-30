import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/dashboard_screen/widgets/performance_card.dart';
import 'package:uidev/screens/dashboard_screen/widgets/animated_popup.dart';
import 'package:uidev/screens/dashboard_screen/widgets/circle_avatar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildDashboardBody(context)]);
  }

  SingleChildScrollView _buildDashboardBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color:Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Leads",
                    style: TextStyle(
                      color:blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    activeTrackColor:greenColor,
                    value: _checkValue,
                    onChanged: (newValue) {
                      setState(() {
                        _checkValue = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            Divider(thickness: .5),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 140,
                            width: 150,
                            child: Card(
                              color: greenColor,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: whiteColor,
                                      radius: 25,
                                      child: Icon(
                                        Icons.trending_up,
                                        color: greenColor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Sales closed today',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: whiteColor,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '14',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 140,
                            width: 150,
                            child: Card(
                              color:orangeColor,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      child: Icon(
                                        Icons.trending_down,
                                        color:orangeColor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Cold leads',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconCircle(
                              angle: -4,
                              bgColor: const Color(0xFFE08AEF),
                              circleIcon: Icons.link,
                              titleText: 'Payment links',
                              subTitle: '14',
                            ),
                            IconCircle(
                              angle: 0,
                              bgColor:greenColor,
                              circleIcon: Icons.star_outline,
                              titleText: 'Expected sale',
                              subTitle: '1,10,000',
                            ),
                            IconCircle(
                              angle: 0,
                              bgColor:orangeColor,
                              circleIcon: Icons.location_searching_outlined,
                              titleText: 'Pending target',
                              subTitle: '1,10,000',
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconCircle(
                              angle: 0,
                              bgColor: Colors.pink[200],
                              circleIcon: Icons.credit_card_outlined,
                              titleText: 'Partial Payment',
                              subTitle: '4',
                            ),
                            IconCircle(
                              angle: 0,
                              bgColor: Colors.blue[300],
                              circleIcon: Icons.arrow_forward,
                              titleText: 'Actual Sale',
                              subTitle: '80,000',
                            ),
                            IconCircle(
                              angle: 0,
                              bgColor: Colors.yellow[700],
                              circleIcon: Icons.percent_outlined,
                              titleText: 'Performance',
                              subTitle: '90%',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            heigt10,
            PerformanceCard(title: 'Performance', value: '90%'),
            SizedBox(height: 10),
            PerformanceCard(
              title: 'This month',
              value: '₹ 36,000',
              titleicon: Icons.expand_more,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

void showNewLeadPopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: "New Lead",
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return const NewLeadPopup();
    },
    transitionBuilder: (_, animation, __, child) {
      return Transform.scale(
        scale: Curves.easeOutBack.transform(animation.value),
        child: Opacity(opacity: animation.value, child: child),
      );
    },
  );
}
