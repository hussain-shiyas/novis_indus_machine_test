import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:novis_machine_test/ui/login_screen/presentation/widget/title_text_field.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/branch_list_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_req_model.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/provider/register_notifier_provider.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/widget/pdf_screen.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/widget/title_calendar_field.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/widget/treatment_list_tile.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
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
  String? selectedBranch;
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(registerNotifierProvider.notifier).getTreatmentList();
      ref.read(registerNotifierProvider.notifier).getBranchList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerData = ref.watch(registerNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/notification_icon.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Divider(),
            Expanded(
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
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xff000000).withOpacity(.1),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButton<String>(
                      value: selectedLocation,
                      isExpanded: true,
                      underline: Container(),
                      hint: const Text("Choose your Location"),
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
                  registerData.branchListState.maybeWhen(orElse: () {
                    return Container(
                      height: 55,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xff000000).withOpacity(.1),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }, failure: (d) {
                    return Container(
                      height: 55,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xff000000).withOpacity(.1),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Text("Something Went Wrong"),
                    );
                  }, success: (branchList) {
                    return Container(
                      height: 55,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xff000000).withOpacity(.1),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButton<String>(
                        value: selectedBranch,
                        hint: const Text("Select your branch"),
                        isExpanded: true,
                        underline: Container(),
                        items: branchList.branches?.map((Branch tempBranch) {
                          return DropdownMenuItem<String>(
                            value: tempBranch.name,
                            child: Text(tempBranch.name ?? ""),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedBranch = newValue;
                            });
                          }
                        },
                      ),
                    );
                  }),
                  const TreatmentListTile(),
                  InkWell(
                    onTap: () {
                      showTreatmentBottomSheet(context);
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
                  const Text("Payment Option"),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 3.2,
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
                        width: MediaQuery.sizeOf(context).width / 3.2,
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
                        width: MediaQuery.sizeOf(context).width / 3.2,
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
                  const Text("Treatment Time"),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: const Color(0xff000000).withOpacity(.1),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12)),
                          child: DropdownButton<String>(
                            value: selectedLocation,
                            isExpanded: true,
                            underline: Container(),
                            hint: const Text("Hour"),
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
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: const Color(0xff000000).withOpacity(.1),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12)),
                          child: DropdownButton<String>(
                            value: selectedLocation,
                            isExpanded: true,
                            underline: Container(),
                            hint: const Text("Minutes"),
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
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () async {
                      // ref.read(registerNotifierProvider.notifier)
                      //     .submitRegisterForm(RegisterReqModel(
                      //   address: addressController.text,
                      //   advanceAmount: int.parse(advanceAmountController.text),
                      //   balanceAmount: int.parse(balanceAmountController.text),
                      //   branch: selectedBranch ?? "",
                      //   dateNdTime:,
                      //   discountAmount: int.parse(discountAmountController
                      //       .text),
                      //   executive:,
                      //   female:,
                      //   id:,
                      //   male:,
                      //   name: nameController.text,
                      //   payment:,
                      //   phone: whatsappController.text,
                      //   totalAmount: int.parse(totalAmountController.text),
                      //   treatments:,
                      // ));

                      // Generate the invoice
                      final pdfData = await generateInvoice();
                      // Display the PDF directly
                      await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
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
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showTreatmentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Treatment',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text('Choose preferred treatment'),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                // Handle preferred treatment selection
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Add Patients',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Male', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Decrease male patients
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text('0'), // Replace with actual count
                            ),
                            IconButton(
                              onPressed: () {
                                // Increase male patients
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16), // Space between male and female
                Expanded(
                  child: Column(
                    children: [
                      Text('Female', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Decrease female patients
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text('0'), // Replace with actual count
                            ),
                            IconButton(
                              onPressed: () {
                                // Increase female patients
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle save button press
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // primary: const Color(0xff006837), // Green color
              ),
            ),
          ],
        ),
      );
    },
  );
}