import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';

class AdmissionFormScreen extends StatelessWidget {
  final Function(int) onFormSubmitted;
  const AdmissionFormScreen({super.key, required this.onFormSubmitted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:whiteColor,
      appBar: AppBar(
        backgroundColor:whiteColor,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color:blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          'Markus Coralo',
          style: TextStyle(color:blackColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),

                _buildCustomTextField(
                  label: "Address Line 1",
                  initialValue: "House No.427/BF",
                ),

                _buildCustomTextField(
                  label: "Address Line 2",
                  initialValue: "Streen Name",
                  isHighlighted: true,
                ),

                _buildCustomTextField(
                  label: "Address Line 3",
                  hintText: "Address Line 3",
                ),

                _buildCustomTextField(label: "Pincode", hintText: "Pincode"),

                const SizedBox(height: 20),

                _buildCustomTextField(
                  label: "Alternate Phone Number",
                  hintText: "Alternate Phone Number",
                ),

                _buildCustomDropdown(label: "Batch"),

                const SizedBox(height: 40),

                const SizedBox(height: 20),
              ],
            ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onFormSubmitted(2);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D1E26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child:  Text(
                  "Submit",
                  style: TextStyle(
                    color:whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required String label,
    String? initialValue,
    String? hintText,
    bool isHighlighted = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHighlighted ? const Color(0xFF22C55E) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 2),
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style:  TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomDropdown({required String label}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
          ),
           Icon(Icons.keyboard_arrow_down, color:greyColor),
        ],
      ),
    );
  }
}
