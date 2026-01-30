import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/leads_screens/leads_details.dart';

class ChangeStatusBottomSheet extends StatefulWidget {
  const ChangeStatusBottomSheet({super.key});

  @override
  State<ChangeStatusBottomSheet> createState() =>
      _ChangeStatusBottomSheetState();
}

class _ChangeStatusBottomSheetState extends State<ChangeStatusBottomSheet> {
  int selectedIndex = 1; // Partial Payment selected

  final List<String> options = [
    "Full Payment",
    "Partial Payment",
    "Offline Payment",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration:  BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          /// Drag Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          heigt30,

          /// Title
          const Text(
            "Change Status",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 20),

          /// Product Dropdown
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text("Product", style: TextStyle(color: Colors.grey)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: whiteColor,
                  ),
                  child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Payment Options
          ...List.generate(
            options.length,
            (index) => _paymentTile(
              title: options[index],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),

          heigt20,

          /// Info Message
          if (selectedIndex == 1)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.error_outline, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Partial Payment\n"
                      "The remaining payment must be paid in 3 days. "
                      "Failure in fulfilling the payment will result in a fine of \$100/day.",
                      style: TextStyle(color: Colors.orange, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            if(selectedIndex==2)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.error_outline, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Offline Payment\n"
                      "Payments that are made offline won't be approved until"
                      "accounts verify them",
                      style: TextStyle(color: Colors.orange, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

          heigt30,

          /// Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    side: const BorderSide(color: Colors.black),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>
                    LeadDetailsScreen()
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06202B),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child:  Text(
                    "Continue",
                    style: TextStyle(color:whiteColor),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// Payment Tile
  Widget _paymentTile({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey.shade300,
            ),
            color: isSelected ? Colors.green.withOpacity(.08) :whiteColor,
          ),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
                child:
                    isSelected
                        ?  Icon(Icons.check, color:whiteColor, size: 16)
                        : null,
              ),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
