import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/leads_screens/add_note.dart';
import 'package:uidev/screens/leads_screens/widgets/icon_container.dart';

class LeadDetailsScreen extends StatelessWidget {
  const LeadDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title:  Text(
            "Lead Details",
            style: TextStyle(color:blackColor, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.black54),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 55),
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF7F9FC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Jestin Varghese",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  heigt20,
                  _buildActionButtons(),

                  const SizedBox(height: 30),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return AddNoteSheet();
                            },
                          );
                        },
                        child: _buildAddNoteBanner(),
                      ),
                      const SizedBox(height: 20),
                      Divider(thickness: .7),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: _buildStatusDropdown(),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: _buildDetailsGrid(),
                      ),
                      heigt30,
                      Divider(),
                      heigt20,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: _buildNotesSection(),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child:  Icon(Icons.person, size: 80, color:greyColor),
            ),
          ],
        ),
      ),
    );
  }

  // --- UPDATED WIDGET: Overlapping Profile Background ---

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LeadsIconContainer(
          icon: FontAwesomeIcons.whatsapp,
          containerColor: Colors.teal,
        ), // WhatsApp teal
        const SizedBox(width: 15),
        LeadsIconContainer(icon: Icons.call, containerColor: orangeColor),
        const SizedBox(width: 15),
        LeadsIconContainer(icon: Icons.email, containerColor: Colors.blue),
      ],
    );
  }

  Widget _buildAddNoteBanner() {
    return Container(
      width: 335,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF00C853), // Vivid green
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                "Add Note",
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Create a quick note",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
           Icon(Icons.arrow_forward, color: whiteColor),
        ],
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100, // Matches the profile bg
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Lead Status",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                  Text(
                    "Phone Switched Off",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Icon(Icons.keyboard_arrow_down, color:greyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsGrid() {
    return Column(
      children: [
        _buildDetailRow(
          "Email",
          "markusc@gmail.com",
          "Phone",
          "+91 9874562310",
        ),
        const SizedBox(height: 20),
        _buildDetailRow("Qualification", "Bcom", "Place", "Kollam"),
        const SizedBox(height: 20),
        _buildDetailRow("Source", "Instagram", "Status", "Phone Switched Off"),
        const SizedBox(height: 20),
        _buildDetailRow("Program", "Python", "Payment Type", "Partial Payment"),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _buildDetailItem("Payment Date", "22.02.2022")),
            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailRow(String l1, String v1, String l2, String v2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildDetailItem(l1, v1)),
        Expanded(child: _buildDetailItem(l2, v2)),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Notes",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 20),
        _buildTimelineItem(
          icon: Icons.email_outlined,
          iconBgColor: Colors.redAccent,
          title: "Note heading",
          date: "18-10-2021",
          description:
              "Lorem ipsum dolot sit amet bir calamag toche amir sans. Lorem ipsum dolot sit amet bir.",
          isLast: false,
        ),
        _buildTimelineItem(
          icon: Icons.description_outlined,
          iconBgColor: const Color(0xFF00C853),
          title: "Note heading",
          date: "18-10-2021",
          description:
              "Lorem ipsum dolot sit amet bir calamag toche amir sans. Lorem ipsum dolot sit amet bir.",
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String date,
    required String description,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(icon, color:whiteColor, size: 16),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1,
                    color: Colors.grey[300],
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            date,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
