// import 'package:easyfycare_clinical_app/core/extensions/margin_extension.dart';
// import 'package:flutter/material.dart';
// import '../../core/style/app_text_style.dart';
// import '../../core/style/colors.dart';

// class AppTextField extends StatelessWidget {
//   final String? label;
//   final String labelText;
//   final TextEditingController controller;
//   final TextInputType textInputType;
//   final String? Function(String?)? validator;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final bool readOnly;
//   final ValueChanged<String>? onChanged;
//   final int? maxLength;
//   final int? minLines;
//   final int? max;
//   final bool useHintInsteadOfLabel;
//   final bool isRequired;

//   const AppTextField({
//     super.key,
//     this.label,
//     required this.controller,
//     required this.textInputType,
//     this.validator,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.minLines,
//     this.readOnly = false,
//     required this.labelText,
//     this.onChanged,
//     this.maxLength,
//     this.max,
//     this.useHintInsteadOfLabel = false,
//     this.isRequired = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (label != null) customTitle(label!, isRequired),
//         8.hBox,
//         TextFormField(
//           maxLength: maxLength,
//           minLines: minLines,
//           maxLines: max,
//           readOnly: readOnly,
//           controller: controller,
//           textInputAction: TextInputAction.next,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             counterText: '',
//             suffixIcon: suffixIcon,
//             prefixIcon: prefixIcon,
//             hintText: useHintInsteadOfLabel ? labelText : null,
//             labelText: useHintInsteadOfLabel ? null : labelText,
//             hintStyle: AppTextStyles.textStyle_500_14.copyWith(
//               color: darkGrey,
//             ),
//             labelStyle: AppTextStyles.textStyle_500_14.copyWith(
//               color: darkGrey,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: borderColor, width: 1),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: borderColor, width: 1),
//             ),
//           ),
//           keyboardType: textInputType,
//           validator: validator,
//         ),
//       ],
//     );
//   }
// }

// Widget customTitle(final String label, bool isRequired) {
//   return RichText(
//     text: TextSpan(
//       text: label,
//       style: AppTextStyles.textStyle_500_14.copyWith(
//         color: Colors.black,
//       ),
//       children: isRequired
//           ? const [
//               TextSpan(
//                 text: ' *',
//                 style: TextStyle(
//                   color: Colors.red,
//                 ),
//               ),
//             ]
//           : [],
//     ),
//   );
// }
