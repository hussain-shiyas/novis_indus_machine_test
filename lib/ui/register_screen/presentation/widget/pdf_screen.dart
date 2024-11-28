import 'dart:typed_data';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<Uint8List> generateInvoice() async {
  final pdf = pw.Document();

  // Define custom styles
  final boldText = pw.TextStyle(
    fontSize: 12,
    fontWeight: pw.FontWeight.bold,
  );
  final normalText = pw.TextStyle(fontSize: 12);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("KUMARAKOM", style: boldText),
                    pw.Text(
                      "Cheepunkal P.O, Kottayam, Kerala - 686563\n"
                      "email.union@gmail.com\n"
                      "Mob: +91 9876543210",
                      style: normalText,
                    ),
                  ],
                ),
                // pw.SizedBox(
                //   height: 50,
                //   child: pw.Image(
                //     pw.MemoryImage(
                //       File("assets/app_icon.png").readAsBytesSync(),
                //     ),
                //   ),
                // ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text("Patient Details", style: boldText),
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Name: Salih T", style: normalText),
                pw.Text("Booked On: 31/01/2024", style: normalText),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Address: Nadakkave, Kozhikode", style: normalText),
                pw.Text("Treatment Date: 21/02/2024", style: normalText),
              ],
            ),
            pw.SizedBox(height: 10),
            // Table Header
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 1),
              ),
              child: pw.Row(
                children: [
                  pw.Expanded(child: pw.Text("Treatment", style: boldText)),
                  pw.Text("Price", style: boldText),
                  pw.Text("Male", style: boldText),
                  pw.Text("Female", style: boldText),
                  pw.Text("Total", style: boldText),
                ],
              ),
            ),
            // Table Rows
            pw.Column(
              children: [
                pw.Row(
                  children: [
                    pw.Expanded(child: pw.Text("Panchakarma", style: normalText)),
                    pw.Text("₹230", style: normalText),
                    pw.Text("4", style: normalText),
                    pw.Text("4", style: normalText),
                    pw.Text("₹2,540", style: normalText),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Expanded(child: pw.Text("Njavara Kizhi", style: normalText)),
                    pw.Text("₹230", style: normalText),
                    pw.Text("4", style: normalText),
                    pw.Text("4", style: normalText),
                    pw.Text("₹2,540", style: normalText),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Total Amount: ₹7,620", style: boldText),
                pw.Text("Discount: ₹500", style: normalText),
                pw.Text("Advance: ₹1,200", style: normalText),
                pw.Text("Balance: ₹5,920", style: boldText),
              ],
            ),
          ],
        );
      },
    ),
  );

  // Save the PDF to a file or return the bytes
  return await pdf.save(); // Return the PDF bytes
}
