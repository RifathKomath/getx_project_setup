// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/style/app_text_style.dart';
// import '../../../../core/style/colors.dart';
// import '../../../../shared/widgets/app_button.dart';
// import '../../../../shared/widgets/app_svg.dart';
// import 'package:easyfycare_clinical_app/core/extensions/margin_extension.dart';

// import '../utils/screen_utils.dart';

// class CommonConfirmationDialog extends StatelessWidget {
//   final String title;
//   final String svgIcon;
//   final Widget content;
//   final String primaryButtonText;
//   final VoidCallback primaryButtonTap;
//   final String secondaryButtonText;
//   final VoidCallback secondaryButtonTap;

//   const CommonConfirmationDialog({
//     super.key,
//     required this.title,
//     required this.svgIcon,
//     required this.content,
//     required this.primaryButtonText,
//     required this.primaryButtonTap,
//     required this.secondaryButtonText,
//     required this.secondaryButtonTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       //insetPadding: EdgeInsets.only(left: 350, right: 350),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       backgroundColor: whiteClr,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (title.isNotEmpty || svgIcon.isNotEmpty)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if(svgIcon.isNotEmpty)
//                   AppSvg(assetName: svgIcon),
//                   if (svgIcon.isNotEmpty)
//                   15.w.wBox,
//                   Text(
//                     title,
//                     style: AppTextStyles.textStyle_400_16.copyWith(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             if (title.isNotEmpty || svgIcon.isNotEmpty) 10.h.hBox,

//             Container(
//               decoration: BoxDecoration(
//                 border:title.isNotEmpty || svgIcon.isNotEmpty ?  Border.all(color: messageButtonClr) :null,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
              
//                   children: [
                   
//                     content,
//                     20.h.hBox,
                
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         AppButton(
//                           label: secondaryButtonText,
//                           onTap: secondaryButtonTap,
//                           isFilled: true,
//                         ),
//                         16.wBox,
//                         AppButton(
//                           label: primaryButtonText,
//                           onTap: primaryButtonTap,
//                         ),
//                       ],
//                     ),
                    
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<bool?> appShowDialog(
//   BuildContext context, {
//   required String dialog,

//   Function()? onTap,
// }) {
//   bool isProcessing = false;

//   return showDialog<bool>(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: whiteClr,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 24,
//           vertical: 20,
//         ),
//         content: Text(
//           dialog,
//           textAlign: TextAlign.center,
//           style: AppTextStyles.textStyle_500_14.copyWith(fontSize: 16),
//         ),
//         actionsAlignment: MainAxisAlignment.center,
//         actionsPadding: const EdgeInsets.only(bottom: 16),
//         actions: [
//           SizedBox(
//             width: 120.w,
//             child: AppButton(
//               isFilled: true,
//               label: "No",
//               onTap: () {
//                 Screen.close();
//               },
//             ),
//           ),
//           50.wBox,
//           SizedBox(
//             width: 120.w,
//             child: AppButton(
//               label: "Yes",
//               onTap: () {
//                 Screen.close();
//                 if (!isProcessing) {
//                   isProcessing = true;
//                   onTap?.call();
//                 }
//               },
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
