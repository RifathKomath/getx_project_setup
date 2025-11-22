// import 'package:easyfycare_clinical_app/app/controller/auth/auth_controller.dart';
// import 'package:easyfycare_clinical_app/app/controller/home/home_controller.dart';
// import 'package:easyfycare_clinical_app/app/view/clinic_profile/clinic_profile_view.dart';
// import 'package:easyfycare_clinical_app/app/view/clinic_settings/clinic_settings_view.dart';
// import 'package:easyfycare_clinical_app/app/view/notification/notification_view.dart';
// import 'package:easyfycare_clinical_app/app/view/payment/payment_view.dart';
// import 'package:easyfycare_clinical_app/config.dart';
// import 'package:easyfycare_clinical_app/core/extensions/margin_extension.dart';
// import 'package:easyfycare_clinical_app/core/style/app_text_style.dart';
// import 'package:easyfycare_clinical_app/core/style/colors.dart';
// import 'package:easyfycare_clinical_app/shared/shared_pref.dart';
// import 'package:easyfycare_clinical_app/shared/utils/screen_utils.dart';
// import 'package:easyfycare_clinical_app/shared/widgets/app_confirmation_popup.dart';
// import 'package:easyfycare_clinical_app/shared/widgets/app_svg.dart';
// import 'package:easyfycare_clinical_app/shared/widgets/tele_consulation_popup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../app/model/auth/get_contact_support_response.dart';
// import '../../app/view/home/base_screen.dart';
// import 'discharge _summary_pdf.dart';

// class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool isBackArrowEnabled;
//   const GradientAppBar({super.key, required this.isBackArrowEnabled});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: [Color(0xFF0077B6), Color(0xFF60D394)],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Row(
//             children: [
//               isBackArrowEnabled == true
//                   ? GestureDetector(
//                       onTap: () => Screen.close(),
//                       child: const Padding(
//                         padding: EdgeInsets.only(top: 2),
//                         child: Icon(Icons.arrow_back, color: Colors.white),
//                       ),
//                     )
//                   : 0.wBox,
//               isBackArrowEnabled == true ? 15.wBox : 0.wBox,

//               AppSvg(assetName: "app_logo_S"),
//               15.wBox,
//               Text(
//                 "Easyfy Care",
//                 style: AppTextStyles.textStyle_700_24.copyWith(
//                   fontSize: 20,
//                   color: whiteClr,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(63);
// }

// class ClinicTopNavBar extends StatelessWidget implements PreferredSizeWidget {
//   final String titles;
//   final bool showTabs;

//   const ClinicTopNavBar({
//     super.key,
//     required this.titles,
//     this.showTabs = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final AuthController controller = Get.put(AuthController());
//     return Container(
//       height: preferredSize.height,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [Color(0xFF0077B6), Color(0xFF60D394)],
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Row(
//           children: [
//             AppSvg(assetName: 'app_logo_S', width: 40, height: 40),
//             15.w.wBox,
//             Text(
//               'Easyfy Care',
//               style: AppTextStyles.textStyle_700_12.copyWith(
//                 fontSize: 20,
//                 color: Colors.white,
//               ),
//             ),
//             25.w.wBox,
//             GestureDetector(
//               onTap: () {
//                 Screen.openAsNewPage(BaseScreen(selectedIndex: 0));
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: whiteClr,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Center(
//                   child: Text(
//                     "Home",
//                     style: AppTextStyles.textStyle_600_18.copyWith(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Spacer(),
//             // Top tabs as navigation
//             // if (showTabs)
//             //   Row(
//             //     children: List.generate(titles.length, (index) {
//             //       final isSelected = controller.selectedIndex.value == index;
//             //       return Padding(
//             //         padding: const EdgeInsets.only(right: 24.0),
//             //         child: InkWell(
//             //           onTap: () {
//             //             controller.changeIndex(index);
//             //           },
//             //           child: Container(
//             //             decoration: BoxDecoration(
//             //               borderRadius: BorderRadius.circular(10),
//             //               color: isSelected ? Colors.white : Colors.transparent,
//             //             ),
//             //             padding: const EdgeInsets.symmetric(
//             //               horizontal: 16.0,
//             //               vertical: 10.0,
//             //             ),
//             //             child: Text(
//             //               titles[index],
//             //               style: AppTextStyles.textStyle_600_18.copyWith(
//             //                 color: isSelected ? Colors.black : Colors.white,
//             //               ),
//             //             ),
//             //           ),
//             //         ),
//             //       );
//             //     }),
//             //   ),
//             // Contact support + notification + avatar
//             GestureDetector(
//               onTap: () async {
//                 showDialog(
//                   barrierDismissible: false,
//                   context: context,
//                   builder: (context) {
//                     return const Center(
//                       child: CupertinoActivityIndicator(
//                         color: whiteClr,
//                         radius: 25,
//                       ),
//                     );
//                   },
//                 );
//                 await controller.contactDataListing();
//                 Navigator.of(context).pop();
//                 final info = controller.contactDataList.isNotEmpty
//                     ? controller.contactDataList.first
//                     : null;
//                 showDialog(
//                   barrierDismissible: false,
//                   context: context,
//                   builder: (context) {
//                     return contactInfoDialog(info: info);
//                   },
//                 );
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.transparent,
//                   border: Border.all(color: whiteClr),
//                 ),
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Contact Support",
//                       style: AppTextStyles.textStyle_600_18.copyWith(
//                         color: whiteClr,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             14.w.wBox,

//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.transparent,
//                 border: Border.all(color: whiteClr),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   clinicInfo?.hospitalName ??
//                       clinicSaveInfo?.hospitalName ??
//                       "-",
//                   style: AppTextStyles.textStyle_600_18.copyWith(
//                     color: whiteClr,
//                   ),
//                 ),
//               ),
//             ),

//             14.w.wBox,
//             PopupMenuButton<String>(
//               color: whiteClr,
//               onSelected: (value) {
//                 // if (value == "Change Password") {
//                 //   showDialog(
//                 //     context: context,
//                 //     builder:
//                 //         (context) => ChangePasswordDialog(),
//                 //   );
//                 // }
//                 if (value == "Payments") {
//                   Screen.open(PaymentView());
//                 }
//                 if (value == "Clinic Profile") {
//                   Screen.open(ClinicProfileView());
//                 }
//                 if (value == "Clinic Settings") {
//                   Screen.open(ClinicSettingsView());
//                 }
//                 if (value == "Logout") {
//                   showDialog(
//                     barrierDismissible: false,
//                     context: context,
//                     builder: (_) => CommonConfirmationDialog(
//                       title: "Logout",
//                       svgIcon: "",
//                       content: Column(
//                         children: [
//                           20.h.hBox,
//                           Text(
//                             "Are you sure you want to logout?",
//                             style: AppTextStyles.textStyle_600_20.copyWith(
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           20.h.hBox,
//                         ],
//                       ),
//                       primaryButtonText: "Yes",
//                       primaryButtonTap: () {
//                         SharedPref().logout();
//                       },
//                       secondaryButtonText: "No",
//                       secondaryButtonTap: () {
//                         Screen.close();
//                       },
//                     ),
//                   );
//                 }
//               },
//               itemBuilder: (BuildContext context) => [
//                 PopupMenuItem(
//                   value: 'Clinic Profile',
//                   child: SizedBox(
//                     width: 150,
//                     child: Text(
//                       'Clinic Profile',
//                       style: AppTextStyles.textStyle_600_16,
//                     ),
//                   ),
//                 ),
//                 PopupMenuItem(
//                   value: 'Payments',
//                   child: SizedBox(
//                     width: 150,
//                     child: Text(
//                       'Payments',
//                       style: AppTextStyles.textStyle_600_16,
//                     ),
//                   ),
//                 ),
//                 PopupMenuItem(
//                   value: 'Clinic Settings',
//                   child: SizedBox(
//                     width: 150,
//                     child: Text(
//                       'Clinic Settings',
//                       style: AppTextStyles.textStyle_600_16,
//                     ),
//                   ),
//                 ),

//                 PopupMenuItem(
//                   value: 'Logout',
//                   child: SizedBox(
//                     width: 150,
//                     child: Text(
//                       'Logout',
//                       style: AppTextStyles.textStyle_600_16,
//                     ),
//                   ),
//                 ),
//               ],
//               child: CircleAvatar(
//                 backgroundImage:
//                     clinicInfo?.profilePicUrl != null ||
//                         clinicSaveInfo?.profilePicUrl != null
//                     ? NetworkImage(
//                         clinicInfo?.profilePicUrl! ??
//                             clinicSaveInfo?.profilePicUrl!,
//                       )
//                     : AssetImage("assets/images/no_profile_found.png"),
//               ),
//             ),
//             14.w.wBox,
//             AppSvg(
//               assetName: "notification_icon_clinic_app",
//               height: 40.h,
//               onPressed: () {
//                 Screen.open(NotificationView());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(88);
// }

// Widget contactInfoDialog({required ContactDatum? info}) {
//   return Dialog(
//     insetPadding: const EdgeInsets.symmetric(horizontal: 240),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//     backgroundColor: whiteClr,
//     child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Easyfy Care Support",
//                 style: AppTextStyles.textStyle_400_16.copyWith(fontSize: 20),
//               ),
//               GestureDetector(
//                 onTap: () => Screen.close(),
//                 child: Icon(Icons.close, color: darkPrimary),
//               ),
//             ],
//           ),
//           20.h.hBox,
//           Center(
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: messageButtonClr),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AppSvg(assetName: "bordered_app_Icon"),
//                     15.h.hBox,
//                     Text("Easyfy Care", style: AppTextStyles.textStyle_700_24),
//                     15.h.hBox,
//                     Text(
//                       info?.businessAddress?.replaceFirst(
//                             "Easyfycare Pvt lTD\n",
//                             "",
//                           ) ??
//                           "-",
//                       style: AppTextStyles.textStyle_500_14,
//                     ),
//                     20.h.hBox,
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: darkPrimary,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             AppSvg(assetName: "mail_icon"),
//                             10.w.wBox,
//                             Text(
//                               info?.email ?? "-",
//                               style: AppTextStyles.textStyle_500_14.copyWith(
//                                 color: whiteClr,
//                               ),
//                             ),
//                             10.w.wBox,
//                             AppSvg(assetName: "whatsapp"),
//                             10.w.wBox,
//                             Text(
//                               info?.whatsappNumber ?? "-",
//                               style: AppTextStyles.textStyle_500_14.copyWith(
//                                 color: whiteClr,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ).paddingSymmetric(horizontal: 30),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
