// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
//
// /// Old flushbar — keep as-is or customize
// getFlushBar(BuildContext context, {required String message,}) {
//   return Flushbar(
//     message: message,
//     icon: const Icon(
//       Icons.info_outline,
//       size: 28.0,
//       color: Colors.blue,
//     ),
//     isDismissible: false,
//     margin: const EdgeInsets.all(8),
//     borderRadius: BorderRadius.circular(8),
//     duration: const Duration(seconds: 3),
//   )..show(context);
// }
//
//
// /// Top Flush Bar for Validation
// getTopFlushBar(BuildContext context, {required String message,}) {
//   return Flushbar(
//     flushbarPosition: FlushbarPosition.TOP,
//     flushbarStyle: FlushbarStyle.FLOATING,
//     backgroundColor: Colors.transparent,
//     padding: EdgeInsets.zero,
//     margin: EdgeInsets.zero,
//     isDismissible: false,
//     duration: const Duration(seconds: 3),
//     messageText: Center(
//       child: Container(
//         height: 40,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         constraints: const BoxConstraints(
//           maxWidth: 300, // Optional cap for very long messages
//         ),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(100),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Flexible(
//               child: Text(
//                 message,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: -0.3,
//                 ),
//                 // overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             const SizedBox(width: 8),
//             GestureDetector(
//               onTap: () => Navigator.of(context).pop(),
//               child: const Icon(
//                 Icons.close,
//                 color: Colors.white,
//                 size: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   )..show(context);
// }
//
