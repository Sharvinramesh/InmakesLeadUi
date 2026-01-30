// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/leads_screens/create_lead.dart';
import 'package:uidev/screens/leads_screens/widgets/icon_container.dart';
import 'package:uidev/screens/leads_screens/widgets/change_status.dart';
import 'package:uidev/screens/leads_screens/widgets/filter.dart';

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  List<bool> isStatusOpenList = List.generate(10, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text("Leads", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 10),
              child: Row(
                children: [
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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CreateLeadScreen()));
                    },
                    icon: Icon(Icons.add, size: 35, color:blackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            if (isSearching) _buildSearchBar(),
            SizedBox(height:15),
            Divider(
              thickness:.5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Jestin Varghese',
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
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: whiteColor,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(24),
                                          ),
                                        ),
                                        builder: (BuildContext context) {
                                          return ChangeStatusBottomSheet();
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.chevron_right,
                                      size: 22,
                                      color:greyColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
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
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                width10,
                                if (index < 2)
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:greenColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 4,
                                        bottom: 4,
                                      ),
                                      child: Text(
                                        'New Lead',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                width10,
                                if (index == 0)
                                  Container(
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: whiteColor,
                                    ),
                                  ),
                                if (index == 1)
                                  Container(
                                    height: 28,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.pink,
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.instagram,
                                      color: whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                if (index == 2)
                                  Container(
                                    height: 28,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.deepPurple[300],
                                    ),
                                    child: Icon(
                                      Icons.language,
                                      color: whiteColor,
                                      size: 19,
                                    ),
                                  ),
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
                            if (isStatusOpenList[index])
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: 'Status',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(.06),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isStatusOpenList[index] = false;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          isStatusOpenList[index]
                                              ? Icons.keyboard_arrow_down
                                              : Icons.keyboard_arrow_up,
                                          color:greyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isStatusOpenList[index] = true; // show
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_up,
                                          color: whiteColor,
                                        ),
                                        SizedBox(width: 8),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              showFilterBottomSheet(context);
            },
            icon: Icon(Icons.filter_list),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(.8)),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: whiteColor,
          filled: true,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.6)),
        ),
      ),
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return const FilterBottomSheet();
      },
    );
  }
}
