// import 'package:easyfycare_clinical_app/shared/widgets/app_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../../core/style/colors.dart';
// import '../utils/screen_utils.dart';

// class CommonBottomNav extends StatelessWidget {
//   final VoidCallback? onContinue;
//   final bool isAtBottom;
//   final String buttonLabel;
//   final String backLabel;
//   const CommonBottomNav({
//     super.key,
//     required this.isAtBottom,
//     required this.onContinue,
//     required this.buttonLabel,
//     required this.backLabel
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 12,
//           right: 12,
//           bottom: 20,
//           top: 12,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             if(backLabel.isEmpty)
//             SizedBox(),
//             if (backLabel.isNotEmpty)
//             SizedBox(
//             width: 134,
//                 height: 40,
//               child: AppButton(
//                 label: backLabel,
//                 onTap: () {
//                   Screen.close();
//                 },
//                 isFilled: true,
//               ),
//             ),
            
//             SizedBox(
//             //   width: 200,
//             //  height: 50,
//               child: AppButton(
//                 label: buttonLabel,
//                 onTap: isAtBottom ? onContinue : null,
//                 bgColor: isAtBottom
//                     ? null
//                     : const Color.fromARGB(255, 187, 220, 249),
//                 textColor: isAtBottom ? null : whiteClr,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
