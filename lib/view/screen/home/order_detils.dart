// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:ticket_widget/ticket_widget.dart';
//
// import '../controller/ticket_controller.dart';
// import '../model/ticket_model.dart';
// class OrderDetils extends StatelessWidget {
//   const OrderDetils({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TicketController ticketController = Get.put(TicketController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF00676C),
//         leading: Icon(Icons.arrow_back, color: Colors.white),
//         title: Text(
//           "Select Your Seat",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(Icons.info_outline, color: Colors.white),
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           TicketWidget(
//             width: double.infinity,
//             height: 210.h,
//             isCornerRounded: true,
//             padding: const EdgeInsets.all(20),
//             child: TicketItem(ticket: ticket),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class TicketItem extends StatelessWidget {
//   final Ticket ticket;
//
//   const TicketItem({Key? key, required this.ticket}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(Icons.train, color: Color(0xFF075E63)),
//             SizedBox(
//               width: 5.w,
//             ),
//             Text(
//               ticket.trainName,
//               style: TextStyle(
//                 fontSize: 17.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             Spacer(),
//             Text(
//               "${ticket.price}",
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'New York City',
//               style: TextStyle(
//                 fontSize: 15.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey,
//               ),
//             ),
//             Text(
//               'Pennsylvania',
//               style: TextStyle(
//                 fontSize: 15.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'NYC',
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               'PNV',
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         Text(
//           '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
//           style: TextStyle(color: Colors.grey),
//         ),
//         SizedBox(height: 6.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '${ticket.departureTime}',
//               style: TextStyle(
//                   fontSize: 15.sp,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//             Icon(Icons.train, color: Color(0xFF075E63)),
//             Text(
//               '${ticket.arrivalTime}',
//               style: TextStyle(
//                   fontSize: 15.sp,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         SizedBox(height: 5.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '${ticket.departureDate}',
//               style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//             ),
//             Text(
//               '${ticket.arrivalDate}',
//               style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Duratian:${ticket.duration}',
//               style: TextStyle(color: Colors.grey, fontSize: 10.sp),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }