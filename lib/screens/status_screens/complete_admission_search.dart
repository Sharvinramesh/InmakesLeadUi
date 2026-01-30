import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
class StatusCompleteAdmissionSearchBar extends StatelessWidget {
  const StatusCompleteAdmissionSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  // showFilterBottomSheet(context);
                },

                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.filter_list,
                      color: Colors.grey.withOpacity(0.6),
                      size: 30,
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration:  BoxDecoration(
                          color:greenColor,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '2',
                          style: TextStyle(
                            color:whiteColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.withOpacity(.8)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: whiteColor,
              filled: true,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.6)),
            ),
          ),
        ),
        heigt15,
        Divider(thickness: .3),
      ],
    );
  }
  }


