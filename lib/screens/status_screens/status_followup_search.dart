import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/status_screens/status_filter.dart';

class StatusBuildSearchBar extends StatelessWidget {
  final Function(int) onPageChange;
  const StatusBuildSearchBar({super.key, required this.onPageChange});

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

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return StatusFilterBottomSheet(
          onContinue: (index) {
            onPageChange(index);
          },
        );
      },
    );
  }
}
