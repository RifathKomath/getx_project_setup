// import 'dart:typed_data';
// import 'package:easyfycare_clinical_app/app/view/home/base_screen.dart';
// import 'package:easyfycare_clinical_app/shared/utils/screen_utils.dart';
// import 'package:easyfycare_clinical_app/shared/utils/validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// import '../../app/controller/home/home_controller.dart';
 
// Future<Uint8List> generateDischargeSummaryPdf({
//   required HomeController controller,
//   required int patientId,
//   required int cycleId,
// }) async {
//   final pdf = pw.Document();

//   await controller.dischargeSummaryListing(
//     patientId: patientId,
//     cycleId: cycleId,
//   );

//   final dichargeInfo = controller.dischargeSummaryList.value;

//   final formattedNextReviewDate = dichargeInfo?.nextReviewDate != null
//       ? DateFormat('dd MMM yyyy').format(dichargeInfo!.nextReviewDate!)
//       : '-';

//   pdf.addPage(
//     pw.MultiPage(
//       margin: const pw.EdgeInsets.all(24),
//       build: (context) => [
//         pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             // ================= HEADER =================
//             pw.Center(
//               child: pw.Text(
//                 "${dichargeInfo?.clinicName ?? '-'}, ${dichargeInfo?.clinicAddress ?? '-'}",
//                 textAlign: pw.TextAlign.center,
//                 style: pw.TextStyle(
//                   fontSize: 18,
//                   fontWeight: pw.FontWeight.bold,
//                   color: PdfColor.fromHex('#0D47A1'),
//                 ),
//               ),
//             ),

//             pw.SizedBox(height: 10),

//             pw.Center(
//               child: pw.Text(
//                 "DISCHARGE SUMMARY",
//                 style: pw.TextStyle(
//                   fontSize: 16,
//                   fontWeight: pw.FontWeight.bold,
//                   decoration: pw.TextDecoration.underline,
//                   color: PdfColor.fromHex('#0D47A1'),
//                 ),
//               ),
//             ),

//             pw.SizedBox(height: 20),

//             // ================= PATIENT DETAILS =================
//             pw.Text(
//               "PATIENT DETAILS :",
//               style: pw.TextStyle(
//                 fontWeight: pw.FontWeight.bold,
//                 color: PdfColor.fromHex('#0D47A1'),
//               ),
//             ),
//             pw.SizedBox(height: 10),
//             pw.Text("Name : ${dichargeInfo?.patientName ?? '-'}"),
//             pw.SizedBox(height: 5),
//             pw.Text("Age/Gender : ${dichargeInfo?.age ?? '-'} Yr / ${dichargeInfo?.gender ?? '-'}"),
//             pw.SizedBox(height: 5),
//             pw.Text("Patient No. : ${dichargeInfo?.patientNo ?? '-'}"),
//             pw.SizedBox(height: 5),
//             pw.Text(
//               "Admission Date : ${dichargeInfo?.treatmentAdvice?.scheduledDate ?? "-"} "
//               "${dichargeInfo?.treatmentAdvice?.scheduledTime ?? "-"}",
//             ),
//             pw.SizedBox(height: 5),
//             pw.Text(
//               "Consultant In Charge : ${dichargeInfo?.treatmentAdvice?.physician?.upperFirst ?? "-"}",
//             ),

//             pw.SizedBox(height: 20),

//             // ================= DIAGNOSIS =================
//             pw.Text(
//               "DIAGNOSIS :",
//               style: pw.TextStyle(
//                 fontWeight: pw.FontWeight.bold,
//                 color: PdfColor.fromHex('#0D47A1'),
//               ),
//             ),
//             pw.SizedBox(height: 10),
//             pw.Text(
//               dichargeInfo?.medicalDetails?.cancerTypeName?.toString() ?? "-",
//             ),
//             pw.SizedBox(height: 5),
//             pw.Text(
//               "On Palliative chemo with ${dichargeInfo?.regimenDrugNames?.join(', ') ?? '-'}",
//             ),

//             pw.SizedBox(height: 20),

//             // ================= EVALUATION =================
//             pw.Text(
//               "EVALUATION AND MANAGEMENT :",
//               style: pw.TextStyle(
//                 fontWeight: pw.FontWeight.bold,
//                 color: PdfColor.fromHex('#0D47A1'),
//               ),
//             ),

//             pw.SizedBox(height: 10),
//             pw.Text("Chemotherapy :"),
//             pw.SizedBox(height: 5),

//             pw.Bullet(
//               text:
//                   "Regimen : ${dichargeInfo?.regimenName ?? "-"} / ${(() {
//                     final cycles = dichargeInfo?.regimenCycles;
//                     if (cycles == null || cycles.isEmpty) return '-';
//                     final cleaned = cycles.map((e) => e.replaceAll('Cycle', '').trim()).toList();
//                     if (cleaned.length == 1) return cleaned.first;
//                     return '${cleaned.first} - ${cleaned.last}';
//                   })()}",
//             ),

//             pw.Bullet(
//               text:
//                   "Cycle Number : ${dichargeInfo?.currentCycle?.replaceFirst("Cycle", "")}",
//             ),

//             pw.SizedBox(height: 20),

//             // ================= TREATMENT TABLE =================
//             pw.Text(
//               "TREATMENT ADVISED ON DISCHARGE :",
//               style: pw.TextStyle(
//                 fontWeight: pw.FontWeight.bold,
//                 color: PdfColor.fromHex('#0D47A1'),
//               ),
//             ),
//             pw.SizedBox(height: 10),

//             pw.Table(
//               border: pw.TableBorder.all(
//                 width: 1,
//                 color: PdfColor.fromHex('#BDBDBD'),
//               ),
//               columnWidths: {
//                 0: const pw.FlexColumnWidth(1),
//                 1: const pw.FlexColumnWidth(3),
//                 2: const pw.FlexColumnWidth(3),
//                 3: const pw.FlexColumnWidth(2),
//               },
//               children: [
//                 pw.TableRow(
//                   decoration: pw.BoxDecoration(
//                     color: PdfColor.fromHex('#BBDEFB'),
//                   ),
//                   children: [
//                     pw.Padding(
//                       padding: const pw.EdgeInsets.all(6),
//                       child: pw.Text("No.", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                     ),
//                     pw.Padding(
//                       padding: const pw.EdgeInsets.all(6),
//                       child: pw.Text("Description", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                     ),
//                     pw.Padding(
//                       padding: const pw.EdgeInsets.all(6),
//                       child: pw.Text("Dosage Instruction", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                     ),
//                     pw.Padding(
//                       padding: const pw.EdgeInsets.all(6),
//                       child: pw.Text("Duration", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                     ),
//                   ],
//                 ),

//                 ...List.generate(
//                   (dichargeInfo?.treatmentAdvice?.postDrugDetails?.length ?? 0),
//                   (index) {
//                     final item = dichargeInfo!.treatmentAdvice?.postDrugDetails![index];
//                     final isEven = index % 2 == 0;

//                     return pw.TableRow(
//                       decoration: pw.BoxDecoration(
//                         color: isEven ? PdfColor.fromHex('#E3F2FD') : PdfColors.white,
//                       ),
//                       children: [
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(6),
//                           child: pw.Text("${index + 1}"),
//                         ),
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(6),
//                           child: pw.Text(item?.postDrug ?? "-"),
//                         ),
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(6),
//                           child: pw.Text(item?.preferedDosage ?? "-"),
//                         ),
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(6),
//                           child: pw.Text(item?.duration ?? "-"),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ],
//             ),

//             pw.SizedBox(height: 20),

//             // ================= REVIEW =================
//             pw.Text(
//               "REVIEW / FOLLOW - UP ADVICE : ",
//               style: pw.TextStyle(
//                 fontWeight: pw.FontWeight.bold,
//                 color: PdfColor.fromHex('#0D47A1'),
//               ),
//             ),

//             pw.SizedBox(height: 10),
//             pw.Text(
//               "Review on $formattedNextReviewDate, "
//               "${dichargeInfo?.treatmentAdvice?.generalAdvice}, "
//               "${dichargeInfo?.treatmentAdvice?.followUpInstruction}",
//             ),

//             pw.SizedBox(height: 30),

//             // ================= SIGNATURES =================
//             pw.Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: [
//                 // Prepared By
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text("PREPARED BY", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 10),
//                     pw.Text(dichargeInfo?.treatmentAdvice?.physician?.upperFirst ?? "-"),
//                     pw.SizedBox(height: 5),
//                     pw.Text(dichargeInfo?.clinicName?.upperFirst ?? "-"),
//                     pw.SizedBox(height: 5),
//                     pw.Text("CONSULTANT"),
//                   ],
//                 ),

//                 // Authorised By
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.end,
//                   children: [
//                     pw.Text("AUTHORISED BY", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 10),
//                     pw.Text(dichargeInfo?.doctorName?.upperFirst ?? "-"),
//                     pw.SizedBox(height: 5),
//                     pw.Text(dichargeInfo?.hospitalName?.upperFirst ?? "-"),
//                     pw.SizedBox(height: 5),
//                     pw.Text("DOCTOR"),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   );

//   return pdf.save();
// }

// Future<Uint8List> getImageFromAsset(String path) async {
//   final data = await rootBundle.load(path);
//   return data.buffer.asUint8List();
// }

// Future<void> showPdfPreview(
//   BuildContext context,
//   HomeController controller,
//   int patientId,
//   int cycleId,
// ) async {
//   final pdfData = await generateDischargeSummaryPdf(
//     controller: controller,
//     patientId: patientId,
//     cycleId: cycleId,
//   );

//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Discharge Summary'),
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new),
//             onPressed: () {
//               Screen.openAsNewPage(BaseScreen());
//             },
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.download),
//               onPressed: () async {
//                 await Printing.sharePdf(
//                   bytes: pdfData,
//                   filename: 'Discharge_Summary.pdf',
//                 );
//               },
//             ),
//           ],
//         ),
//         body: PdfPreview(
//           build: (format) async => pdfData,
//           allowPrinting: false,
//           allowSharing: false,
//           canChangeOrientation: false,
//           canChangePageFormat: false,
//           pdfFileName: 'Discharge_Summary.pdf',
//           maxPageWidth: 600,
//         ),
//       ),
//     ),
//   );
// }
