// import 'package:easyfycare_clinical_app/core/extensions/margin_extension.dart';
// import 'package:easyfycare_clinical_app/core/style/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import '../../core/style/app_text_style.dart';
// import 'app_svg.dart';

// class CustomDropdown<T> extends StatelessWidget {
//   final T? selectedValue;
//   final List<T> items;
//   final Function(T?) onChanged;
//   final String hint;
//   final double? w;
//   final bool showHeading;
//   final String? headingText;
//   final double? h;
//   final TextStyle? hintStyle;
//   final String Function(T)? itemToString;

//   /// NEW: pass a validator just like you do for `TextFormField`
//   final String? Function(T?)? validator;
//   final double radius;
//   final void Function()? onTap;
//   final bool isloading;

//   const CustomDropdown({
//     super.key,
//     required this.selectedValue,
//     required this.items,
//     required this.onChanged,
//     required this.hint,
//     this.showHeading = false,
//     this.headingText,
//     this.w = 120,
//     this.h = 56,
//     this.hintStyle,
//     this.itemToString,
//     this.onTap,
//     this.isloading = false,
//     this.validator,
//     this.radius = 12.47,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Fix 1: Check if items list is not empty and selectedValue exists in items
//     bool isSelectedValid =
//         selectedValue != null &&
//         items.isNotEmpty &&
//         items.contains(selectedValue);

//     return FormField<T>(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       validator: validator,
//       initialValue: selectedValue,
//       builder: (FormFieldState<T> field) {
//         // final bool isSelectedValid =
//         //     field.value != null && items.contains(field.value);
//         return Column(
//           children: [
//             if (showHeading && headingText != null) ...[
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   headingText!,
//                   style: AppTextStyles.textStyle_500_14,
//                 ),
//               ),
//               12.hBox,
//             ],
            
//             Container(
//               width: w,
//               height: h,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: messageButtonClr, width: 1),
//                 borderRadius: BorderRadius.circular(radius),
//               ),
//               alignment: Alignment.center,
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<T>(
//                   value:isSelectedValid ? field.value : null,
//                   icon: AppSvg(assetName: "grey_down_arrow"),
//                   isExpanded: true,
//                   dropdownColor: Colors.white,
//                   style: AppTextStyles.textStyle_500_14.copyWith(
//                     color: blackGrey,
//                   ),
//                   hint: Text(
//                     hint,
//                     style:
//                         hintStyle ??
//                         AppTextStyles.textStyle_500_14.copyWith(
//                           color: blackGrey,
//                         ),
//                   ),
//                   onChanged: (val) {
//                     field.didChange(val); // ✅ Update FormField first
//                     onChanged(val); // ✅ Then notify controller
//                     field
//                         .validate(); // ✅ Optional: re-validate this field immediately
//                   },
//                    menuMaxHeight: 200, 
//                   items:
//                       items.map((e) {
//                         return DropdownMenuItem<T>(
//                           value: e,
//                           child: Text(
//                             itemToString != null
//                                 ? itemToString!(e)
//                                 : e.toString(),
//                           ),
//                         );
//                       }).toList(),
//                 ),
//               ),
//             ),
//             if (field.hasError)
//               Padding(
//                 padding: const EdgeInsets.only(left: 8, top: 4),
//                 child: Text(
//                   field.errorText ?? '',
//                   style: AppTextStyles.textStyle_400_12.copyWith(
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }


// //Editable Dropdown
// Widget editableDropdown({
//   required String label,
//   required List<String> items,
//   required RxString value,
//   double? width,
// })
// {
//   return Obx(() {
//     return SizedBox(
//       width: width ?? 420.w,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: AppTextStyles.textStyle_500_14.copyWith(
//             color: darkGrey,
//           ),),
//           8.h.hBox,
//           TextFormField(
//             controller: TextEditingController(text: value.value)
//               ..selection = TextSelection.fromPosition(
//                 TextPosition(offset: value.value.length),
//               ),
//             decoration: InputDecoration(
//               hintText: "Select or type",
//               hintStyle: AppTextStyles.textStyle_500_14.copyWith(
//                 color: darkGrey,
//               ),
//               suffixIcon: PopupMenuButton<String>(
//                 icon: const Icon(Icons.arrow_drop_down),
//                 onSelected: (String selected) {
//                   value.value = selected;
//                 },
//                 itemBuilder: (BuildContext context) {
//                   return items.map((String item) {
//                     return PopupMenuItem<String>(
//                       value: item,
//                       child: Text(item),
//                     );
//                   }).toList();
//                 },
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(
//                   color: borderColor, // Normal border color
//                   width: 1, // 👈 custom border width
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(
//                   color: Colors.deepPurple, // 👈 color when focused
//                   width: 2, // 👈 slightly thicker when focused
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(
//                   color: borderColor,
//                   width: 1,
//                 ),
//               ),
//             ),
//             onChanged: (text) => value.value = text,
//           ),
//         ],
//       ),
//     );
//   });
// }