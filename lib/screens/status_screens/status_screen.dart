import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/status_screens/sales_close.dart';
import 'package:uidev/screens/status_screens/status_followup_container.dart';
import 'package:uidev/screens/status_screens/status_followup_search.dart';
import 'package:uidev/screens/status_screens/status_payment_admission.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool isSearching = false;
  int _currentSubIndexPage = 0;
  void _changePage(int index) {
    setState(() {
      _currentSubIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentSubIndexPage) {
      case 1:
        return StatusPaymenAdmissionScreen(onPageChange:(index)=>_changePage(index));
      case 2:
        return SaleClosedScreen(onPageChange:(index)=>_changePage(index));
      default:
        return _buildFollowUpList();
    }
  }

  Scaffold _buildFollowUpList() {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: whiteColor,
          title: Text('Follow Up'),
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
                color: isSearching ?greenColor : blackColor,
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
                        child: Icon(
                          Icons.autorenew,
                          color: greenColor,
                          size: 30,
                        ),
                      ),
                      VerticalDivider(),
                      Icon(Icons.web_asset, size: 30),
                      VerticalDivider(),
                      Icon(Icons.check_circle_outline, size: 30),
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: .3),
            if (isSearching)
              StatusBuildSearchBar(
                onPageChange: (index) {
                  _changePage(index);
                },
              ),
            StatusFollowupContainer(title: 'Markus Coralo'),
          ],
        ),
      ),
    );
  }
}
