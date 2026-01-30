import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';

class SaleClosedScreen extends StatefulWidget {
  final Function(int) onPageChange;
  const SaleClosedScreen({super.key, required this.onPageChange});

  @override
  State<SaleClosedScreen> createState() => _SaleClosedScreenState();
}

class _SaleClosedScreenState extends State<SaleClosedScreen> {
  bool isSearching = false;
  int expandedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:whiteColor,
        elevation: 0,
        title:  Text(
          "Sale Closed",
          style: TextStyle(color:blackColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isSearching ? Icons.search : Icons.search,
              color: isSearching ? greenColor :blackColor,
              size: 28,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FB),
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
                height: 65,
                decoration: BoxDecoration(
                  color:whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Expanded(child: Icon(Icons.refresh, color:greyColor)),
                    VerticalDivider(indent: 15, endIndent: 15),
                    Expanded(
                      child: Icon(Icons.credit_card, color:greyColor),
                    ),
                    VerticalDivider(indent: 15, endIndent: 15),
                    Expanded(
                      child: Icon(
                        Icons.check_circle_outline,
                        color:greenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (isSearching)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color:greyColor),
                    fillColor:whiteColor,
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.filter_list,
                      color:greyColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

            heigt15,
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  bool isExpanded = expandedIndex == index;
                  return _buildExpandableCard(index, isExpanded);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableCard(int index, bool isExpanded) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expandedIndex = isExpanded ? -1 : index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color:whiteColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Markus Coralo",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Product name",
                      style: TextStyle(color:greyColor, fontSize: 14),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),

            if (isExpanded) ...[
              const SizedBox(height: 20),
              _buildInfoRow(
                "Email",
                "markusc@gmail.com",
                "Phone number",
                "+91 9876543210",
              ),
              const SizedBox(height: 15),
              _buildInfoRow(
                "Batch",
                "2021-2022",
                "Alt. Phone number",
                "+91 9876543210",
              ),
              const SizedBox(height: 15),
              const Text(
                "Address",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const Text(
                "House No 336B, Street name, Town, 688866",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],

            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "Created on 18-10-2021",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label1, String val1, String label2, String val2) {
    return Row(
      children: [
        Expanded(child: _buildInfoItem(label1, val1)),
        Expanded(child: _buildInfoItem(label2, val2)),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color:greyColor, fontSize: 12)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ],
    );
  }
}
