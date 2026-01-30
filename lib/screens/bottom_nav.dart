// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/dashboard_screen/dashboard.dart';
import 'package:uidev/screens/leads_screens/leads_screen.dart';
import 'package:uidev/screens/dashboard_screen/notification_screen.dart';
import 'package:uidev/screens/profile_screens/profile_screen.dart';
import 'package:uidev/screens/status_screens/status_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = [
    DashboardScreen(),
    LeadsScreen(),
    StatusScreen(),
    ProfileScreen(),
  ];

  void onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _selectedIndex == 0 ? dashboardAppbar(context) : null,
      body: IndexedStack(index: _selectedIndex, children: widgetOptions),
      // widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTappedItem,
        type: BottomNavigationBarType.fixed,
        selectedItemColor:blackColor,
        backgroundColor:whiteColor,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Leads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: 'Status',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  PreferredSize dashboardAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor:whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Hi Prijith",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ),
                    ).then((showPopup) {
                      if (showPopup == true) {
                        showNewLeadPopup(context);
                      }
                    });
                  },
                  icon: Icon(Icons.notifications_outlined, size: 40),
                ),
                Positioned(
                  right: 6,
                  top: 5,
                  child: Container(
                    height: 22,

                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.red,
                    ),

                    child: Center(
                      child: Text('2', style: TextStyle(color:whiteColor)),
                    ),
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
