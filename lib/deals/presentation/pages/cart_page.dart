// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';
// import 'package:kot/deals/presentation/widgets/custom_button.dart';
// import 'package:kot/my_routes.dart';
// import 'package:kot/toastHelper.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // bottomNavigationBar: const CommonBottom(selectedIndex: 4),
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/app_background.svg"),
//                   fit: BoxFit.fitWidth)),
//           child: Stack(
//             children: [
//               Column(
//                 children: [
//                   SvgPicture.asset(
//                     'assets/app_background.svg',
//                     fit: BoxFit.fill,
//                     width: double.infinity,
//                     height: 250,
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       Row(
//                         //   crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             "assets/splash_screen_bg.png",
//                             height: 30,
//                             width: 30,
//                             //  height: MediaQuery.of(context).size.height - 150,
//                           ),
//                           const Spacer(),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, MyRouters.profileScreen);
//                             },
//                             child: const Icon(
//                               Icons.people,
//                               size: 24,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: GestureDetector(
//                               onTap: () {
//                                 ToastHelper.showToast("Comming Soon");
//                               },
//                               child: Icon(
//                                 Icons.notification_add,
//                                 color: Colors.white,
//                                 size: 24,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.adaptive.arrow_back,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Cart',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           const Spacer(),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 20.0),
//                             child: CustomFilledButton(
//                               onPressed: () {},
//                               color: Colors.white,
//                               child: const Text(
//                                 'Add More',
//                                 style: TextStyle(
//                                   color: Color(0xFF74B9FF),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Total: 2 items',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 70.0),
//                         child: Column(
//                           children: [
//                             for (int i = 0; i < 5; i++) const NewWidget(),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 1,
//                       ),
//                       const SizedBox(height: 20),
//                       // coupon code
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Coupon Code',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 5,
//                             ),
//                           ],
//                           color: Colors.white,
//                         ),
//                         child: Row(
//                           children: [
//                             const SizedBox(width: 20),
//                             Expanded(
//                               child: TextFormField(
//                                 decoration: const InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Enter Coupon Code',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 20),
//                             // CircleAvatar(
//                             //   radius: 14,
//                             //   backgroundColor: const Color(0xFF74B9FF),
//                             //   child: IconButton(
//                             //       onPressed: () {},
//                             //       icon: Icon(
//                             //         Icons.close,
//                             //         size: 15,
//                             //         color: Colors.white,
//                             //       )),
//                             // ),
//                             CustomFilledButton(
//                               child: const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 // child: Icon(Icons.close),
//                                 child: Text(
//                                   'Apply',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {},
//                             ),
//                             const SizedBox(width: 5),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // payment summary
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Payment Summary',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text(
//                                     'Subtotal',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'â‚¹ 100',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text(
//                                     'Discount',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'â‚¹ 0',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text(
//                                     'item discount',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'â‚¹ 100',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text(
//                                     'Shipping',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'â‚¹ 0',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Divider(
//                               thickness: 1,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text(
//                                     'Total',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'â‚¹ 100',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                       CustomFilledButton(
//                         child: Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 14.0),
//                           child: const Center(
//                             child: Text(
//                               'Proceed order',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pushNamed(
//                               context, MyRouters.dealsCheckoutPage);
//                         },
//                       ),
//                       const SizedBox(height: 50),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NewWidget extends StatefulWidget {
//   const NewWidget({
//     super.key,
//   });

//   @override
//   State<NewWidget> createState() => _NewWidgetState();
// }

// class _NewWidgetState extends State<NewWidget> {
//   late int count;
//   @override
//   void initState() {
//     count = 1;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: const EdgeInsets.only(bottom: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 5,
//                   ),
//                 ],
//                 color: Colors.white,
//               ),
//               height: 100,
//               width: 100,
//               padding: const EdgeInsets.all(8.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.network(
//                   'https://source.unsplash.com/random',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Product Name',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: const [
//                       Text(
//                         'Price: ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         'â‚¹ 100',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: const [
//                       Text(
//                         'Size: ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         'M',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 20),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 CircleAvatar(
//                   radius: 12,
//                   backgroundColor: Color(0xFF74B9FF),
//                   child: const Icon(
//                     Icons.close_rounded,
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 // quantity increment decrement
//                 SizedBox(
//                   height: 30,
//                   width: 100,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         splashFactory: NoSplash.splashFactory,
//                         highlightColor: Colors.transparent,
//                         onTap: count < 2
//                             ? null
//                             : () {
//                                 setState(() {
//                                   count--;
//                                 });
//                               },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                           ),
//                           child: const Icon(
//                             Icons.remove,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         count.toString(),
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       InkWell(
//                         splashFactory: NoSplash.splashFactory,
//                         onTap: () {
//                           setState(() {
//                             count++;
//                           });
//                         },
//                         highlightColor: Colors.transparent,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFF74B9FF),
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           child: const Icon(
//                             Icons.add,
//                             color: Colors.black,
//                           ),
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
//     );
//   }
// }
