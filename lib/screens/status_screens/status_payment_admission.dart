  import 'package:flutter/material.dart';
  import 'package:uidev/constants/constants.dart';
  import 'package:uidev/screens/status_screens/complete_admission_search.dart';
  import 'package:uidev/screens/status_screens/user_info_card.dart';

  class StatusPaymenAdmissionScreen extends StatefulWidget {
    final Function(int) onPageChange;
    const StatusPaymenAdmissionScreen({super.key, required this.onPageChange});

    @override
    State<StatusPaymenAdmissionScreen> createState() =>
        _StatusPaymenAdmissionScreenState();
  }

  class _StatusPaymenAdmissionScreenState
      extends State<StatusPaymenAdmissionScreen> {
    bool isSearching = false;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: whiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: whiteColor,
            title: Text('Payment Completed'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
                icon: Icon(
                  isSearching ? Icons.search : Icons.search,
                  size: 35,
                  color: isSearching ? greenColor : blackColor,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: containerClr,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 40,
                      right: 40,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                          angle: 1,
                          child: Icon(Icons.autorenew, size: 30),
                        ),
                        VerticalDivider(),
                        Icon(Icons.web_asset, size: 30, color:greenColor),
                        VerticalDivider(),
                        Icon(Icons.check_circle_outline, size: 30),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: .3),
              if (isSearching)StatusCompleteAdmissionSearchBar(),
              UserInfoCard(
                onPageChange: (index)=>widget.onPageChange(index),
              )
            ],
          ),
        ),
      );
    }
  }
