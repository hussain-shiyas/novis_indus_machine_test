import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:novis_machine_test/ui/login_screen/presentation/widget/title_text_field.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/widget/title_calendar_field.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/widget/treatment_list_tile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();
  final TextEditingController treatmentDateController = TextEditingController();
  String selectedLocation = "Choose your Location";
  final List<String> locations = [
    "Choose your Location",
    "New York",
    "Los Angeles",
    "Chicago",
    "Houston",
    "Miami",
    "San Francisco",
    "London",
    "Manchester",
    "Liverpool",
    "Birmingham",
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Chennai",
    "Kolkata",
    "Kochi"
  ];
  String selectedPaymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            TitleTextField(
              controller: nameController,
              hintText: "Enter your Name",
              title: "Name",
            ),
            TitleTextField(
              controller: whatsappController,
              hintText: "Enter your Whatsapp Number",
              title: "Whatsapp Number",
            ),
            TitleTextField(
              controller: addressController,
              hintText: "Enter your Full Address",
              title: "Address",
            ),
            Container(
              height: 55,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: const Color(0xff000000).withOpacity(.1),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton<String>(
                value: selectedLocation,
                isExpanded: true,
                underline: Container(),
                hint: Text("Choose your Location"),
                items: locations.map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedLocation = newValue;
                    });
                  }
                },
              ),
            ),
            Container(
              height: 55,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: const Color(0xff000000).withOpacity(.1),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton<String>(
                value: selectedLocation,
                isExpanded: true,
                underline: Container(),
                hint: Text("Choose your Location"),
                items: locations.map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedLocation = newValue;
                    });
                  }
                },
              ),
            ),
            TreatmentListTile(),
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff389A48).withOpacity(.4),
                ),
                child: const Center(
                  child: Text(
                    "+Add Treatments",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TitleTextField(
              controller: totalAmountController,
              hintText: "Enter your Name",
              title: "Total Amount",
            ),
            TitleTextField(
              controller: discountAmountController,
              hintText: "Enter your Whatsapp Number",
              title: "Discount Amount",
            ),
            Text("Payment Option"),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/3.2,
                  child: RadioListTile<String>(
                    title: const Text('Cash'),
                    value: 'Cash',
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    groupValue: selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/3.2,
                  child: RadioListTile<String>(
                    title: const Text('Card'),
                    value: 'Card',
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    groupValue: selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/3.2,
                  child: RadioListTile<String>(
                    title: const Text('UPI'),
                    value: 'UPI',
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    groupValue: selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            TitleTextField(
              controller: advanceAmountController,
              hintText: "",
              title: "Advance Amount",
            ),
            TitleTextField(
              controller: balanceAmountController,
              hintText: "",
              title: "Balance Amount",
            ),
            TitleCalendarField(
              controller: treatmentDateController,
              hintText: "Select Treatment Date",
              isDatePicker: true,
            ),
            Text("Treatment Time"),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xff000000).withOpacity(.1),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButton<String>(
                      value: selectedLocation,
                      isExpanded: true,
                      underline: Container(),
                      hint: Text("Hour"),
                      items: locations.map((String location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedLocation = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 55,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xff000000).withOpacity(.1),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButton<String>(
                      value: selectedLocation,
                      isExpanded: true,
                      underline: Container(),
                      hint: Text("Minutes"),
                      items: locations.map((String location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedLocation = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff006837),
                ),
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

