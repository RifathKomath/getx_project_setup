// import 'package:easyfycare_clinical_app/app/model/teleconsulation/teleconsultation_response.dart';
// import 'package:easyfycare_clinical_app/core/extensions/margin_extension.dart';
// import 'package:easyfycare_clinical_app/core/style/app_text_style.dart';
// import 'package:easyfycare_clinical_app/core/style/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../app/view/patient_detail/sub_screens/call_screen.dart';
// import '../utils/screen_utils.dart';


// import 'package:audioplayers/audioplayers.dart';
// import 'package:easyfycare_clinical_app/app/model/teleconsulation/teleconsultation_response.dart';
// import 'package:easyfycare_clinical_app/core/extensions/margin_extension.dart';
// import 'package:easyfycare_clinical_app/core/style/app_text_style.dart';
// import 'package:easyfycare_clinical_app/core/style/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../app/view/patient_detail/sub_screens/call_screen.dart';
// import '../utils/screen_utils.dart';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:easyfycare_clinical_app/app/model/teleconsulation/teleconsultation_response.dart';
// import 'package:easyfycare_clinical_app/core/extensions/margin_extension.dart';
// import 'package:easyfycare_clinical_app/core/style/app_text_style.dart';
// import 'package:easyfycare_clinical_app/core/style/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../app/view/patient_detail/sub_screens/call_screen.dart';
// import '../utils/screen_utils.dart';

// // ✅ Global AudioPlayer instance to manage ringtone
// final AudioPlayer _audioPlayer = AudioPlayer();

// Future<void> showTeleconsultationPopup({
//   required TelecallNotificationResponse data,
// }) async {
//   // ✅ Play looping ringtone until user acts
//   await _audioPlayer.play(
//     AssetSource('sounds/ringtone_sound.mp3'),
//     volume: 1.0,
//     mode: PlayerMode.mediaPlayer,
//   );
//   await _audioPlayer.setReleaseMode(ReleaseMode.loop);

//   Get.dialog(
//     Dialog(
//       backgroundColor: whiteClr,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircleAvatar(
//               radius: 60,
//               backgroundColor: primaryColor,
//               child: ClipOval(
//                 child: data.doctorProfileUrl != null &&
//                     data.doctorProfileUrl?.isNotEmpty == true
//                     ? Image.network(
//                   data.doctorProfileUrl!,
//                   width: 120,
//                   height: 120,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Image.asset(
//                       'assets/images/doctor_pic.jpg',
//                       width: 120,
//                       height: 120,
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 )
//                     : Image.asset(
//                   'assets/images/doctor_pic.jpg',
//                   width: 120,
//                   height: 120,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Text(
//               '${data.doctorName} is ready for video consultation...',
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Patient - ${data.fullName}',
//               textAlign: TextAlign.center,
//               style: AppTextStyles.textStyle_600_20,
//             ),
//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // ❌ DECLINE BUTTON
//                 GestureDetector(
//                   onTap: () async {
//                     // ✅ Stop ringtone
//                     await _audioPlayer.stop();

//                     // ✅ Play decline sound once
//                     // await _audioPlayer.play(
//                     //   AssetSource('sounds/decline_sound.mp3'),
//                     //   volume: 1.0,
//                     // );

//                     // Wait 0.5 sec so sound plays before closing dialog
//                    // await Future.delayed(const Duration(milliseconds: 500));

//                     Get.back();
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.red.shade100,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.call_end,
//                           size: 48,
//                           color: Colors.red,
//                         ),
//                       ),
//                       4.hBox,
//                       Text(
//                         "Decline",
//                         style: AppTextStyles.textStyle_700_16.copyWith(
//                           color: Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // ✅ CONNECT BUTTON
//                 GestureDetector(
//                   onTap: () async {
//                     // ✅ Stop ringtone before navigating
//                     await _audioPlayer.stop();

//                     Get.back(); // Close popup
//                     Screen.open(SampleButton(data: data)); // Go to call screen
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.green.shade100,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.call,
//                           size: 48,
//                           color: Colors.green,
//                         ),
//                       ),
//                       4.hBox,
//                       Text(
//                         "Connect",
//                         style: AppTextStyles.textStyle_700_16.copyWith(
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//     barrierDismissible: false,
//   );
// }



// void showTeleconsultationPopup({required TelecallNotificationResponse data}) {
//   Get.dialog(
//     Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircleAvatar(
//               radius: 60,
//               backgroundColor:primaryColor ,
//               child: ClipOval(
//                 child:
//                     data.doctorProfileUrl != null &&
//                         data.doctorProfileUrl?.isNotEmpty == true
//                     ? Image.network(
//                         data.doctorProfileUrl!,
//                         width: 120,
//                         height: 120,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           // Fallback to default image if network image fails
//                           return Image.asset(
//                             'assets/images/doctor_pic.jpg',
//                             width: 120,
//                         height: 120,
//                             fit: BoxFit.cover,
//                           );
//                         },
//                       )
//                     : Image.asset(
//                         'assets/images/doctor_pic.jpg',
//                          width: 120,
//                         height: 120,
//
//                         fit: BoxFit.cover,
//                       ),
//               ),
//             ),
//             Text(
//               '${data.doctorName} is ready for video consultation...',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Patient- ${data.fullName} ',
//               textAlign: TextAlign.center,
//               style: AppTextStyles.textStyle_600_20,
//             ),
//
//             const SizedBox(height: 12),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Get.back(); // Close dialog
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.red.shade100,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.call_end,
//                           size: 48,
//                           color: Colors.red,
//                         ),
//                       ),
//                       4.hBox,
//
//                       Text(
//                         "Decline",
//                         style: AppTextStyles.textStyle_700_16.copyWith(
//                           color: Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.back(); // Close dialog
//                     Screen.open(SampleButton(data: data));
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.green.shade100,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(Icons.call, size: 48, color: Colors.green),
//                       ),
//                       4.hBox,
//                       Text(
//                         "Connect",
//                         style: AppTextStyles.textStyle_700_16.copyWith(
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             // // Buttons
//             // ElevatedButton(
//             //   onPressed: () {
//             //     Get.back(); // Close dialog
//             //     Screen.open(SampleButton(data: data));
//             //   },
//             //   style: ElevatedButton.styleFrom(
//             //     backgroundColor: Colors.green,
//             //     padding: const EdgeInsets.symmetric(
//             //       vertical: 12,
//             //       horizontal: 16,
//             //     ),
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(8),
//             //     ),
//             //   ),
//             //   child: Text(
//             //     'Connect',
//             //     style: TextStyle(fontSize: 16, color: Colors.white),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     ),
//     barrierDismissible: false, // Prevent dismissing by tapping outside
//   );
// }
