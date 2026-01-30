import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/profile_screens/change_password.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _innerIndex = 0;
  void pageView(int index) {
    setState(() {
      _innerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index:_innerIndex,
      children: [
         _buildMainProfileView(context),
         ChangePasswordScreen(onBack:()=>pageView(0))

      ],
    );
  }

  Scaffold _buildMainProfileView(BuildContext context) {
    return Scaffold(
    backgroundColor: whiteColor,
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: AppBar(
        title: Text("Profile", style: TextStyle()),
        centerTitle: true,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
      ),
    ),
    body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CircleAvatar(
              radius: 70,
              backgroundColor:greenColor,
              child: CircleAvatar(
                radius: 66,
                backgroundColor: whiteColor,
                child: Icon(Icons.person, size: 137, color:greyColor),
              ),
            ),
          ),
          heigt10,
          Text(
            'Jane Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text("janedoe@gmail.com"),
          heigt20,
          GestureDetector(
            onTap: () {
             pageView(1);
            },
            child: Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Change password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'secure your account',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, color: Colors.grey.shade400),
                  ],
                ),
              ),
            ),
          ),
          heigt20,
          SizedBox(
            width: 350,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // 👈 radius here
                ),
              ),
              onPressed: () {
              },
              child: Text("Logout", style: TextStyle(color: whiteColor)),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
