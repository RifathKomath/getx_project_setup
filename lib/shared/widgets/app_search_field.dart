// import 'package:easyfycare_clinical_app/core/style/colors.dart';
// import 'package:flutter/material.dart';
// import '../../core/style/app_text_style.dart';

// class AppSearchField extends StatelessWidget {
//   final TextEditingController controller;
//   final ValueChanged<String> onChanged;
//   final String hintText;
//   final double width;
//   final double height;

//   const AppSearchField({
//     super.key,
//     required this.controller,
//     required this.onChanged,
//     this.hintText = 'Search...',
//     this.width = 200,
//     this.height = 35,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: TextFormField(
//         controller: controller,
//         onChanged: onChanged,
//         style: AppTextStyles.textStyle_400_14.copyWith(
//           decoration: TextDecoration.none,
//         ),
//         decoration: InputDecoration(
//           hintText: hintText,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: grey4Clr),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: grey4Clr),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: darkPrimary, width: 2.0),
//           ),
//           suffixIcon: const Icon(Icons.search, size: 16),
//           hintStyle: AppTextStyles.textStyle_400_14,
//         ),
//       ),
//     );
//   }
// }
