import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/leads_screens/lead_status.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Filter",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 24),

          filterField(
            context: context,
            icon: Icons.calendar_month_outlined,
            hint: "Start Date",
          ),

          const SizedBox(height: 12),

          filterField(
            context: context,
            icon: Icons.calendar_month_outlined,
            hint: "End Date",
          ),

          const SizedBox(height: 12),

          filterField(context: context, hint: "Lead Status", isDropdown: true),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side:  BorderSide(color:blackColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child:  Text(
                    "Reset",
                    style: TextStyle(color:blackColor),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B2C3D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child:  Text(
                    "Search",
                    style: TextStyle(color:whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget filterField({
    required BuildContext context,
    IconData? icon,
    required String hint,
    bool isDropdown = false,
  }) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color:greyColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hint,
              style:  TextStyle(color:greyColor, fontSize: 14),
            ),
          ),
          if (isDropdown)
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color:whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (sheetContext) {
                    return BottomModalSheet();
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
