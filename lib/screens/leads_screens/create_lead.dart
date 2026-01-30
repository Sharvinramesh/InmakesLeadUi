import 'package:flutter/material.dart';
import 'package:uidev/constants/constants.dart';
import 'package:uidev/screens/leads_screens/widgets/create_lead_textfield.dart';

class CreateLeadScreen extends StatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {
  final TextEditingController dateController = TextEditingController(
    text: "02.02.2022 06:14PM",
  );

  final TextEditingController nameController = TextEditingController(
    text: "Mark Spector",
  );

  final TextEditingController phoneController = TextEditingController(
    text: "+91 9874561230",
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color:blackColor),
          onPressed: () {},
        ),
        title:  Text(
          "Create Lead",
          style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            CustomTextField(label: "Date", controller: dateController),
            const SizedBox(height: 16),

            CustomTextField(label: "Name", controller: nameController),
            const SizedBox(height: 16),

            CustomTextField(
              label: "Phone",
              controller: phoneController,
              borderColor: Color(0xFF00C853),
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: "Email",
              controller: emailController,
              hintText: "Enter email",
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: "Qualification",
              controller: qualificationController,
              hintText: "Enter qualification",
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF091E2E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child:  Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}


