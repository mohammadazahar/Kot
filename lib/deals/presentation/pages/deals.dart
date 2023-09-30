// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:kot/boat_booking/presentation/pages/boat_booking_screen2.dart';

// import 'package:kot/deals_new/repository/selectcategory_service.dart';
// import 'package:kot/deals/presentation/widgets/ad_banner/ad_banner.dart';
// import 'package:kot/deals/presentation/widgets/custom_button.dart';
// import 'package:kot/deals_new/controller/select_category_controller.dart';
// import 'package:kot/my_routes.dart';
// import 'package:kot/toastHelper.dart';
// import '../../../deals_new/model/category_model.dart';

// class DealsScreen extends StatefulWidget {
//   final SelectCategoryController selectCategoryController = Get.put(
//     SelectCategoryController(categoryService: SelectCategoryService()),
//   );
//   DealsScreen({super.key});

//   @override
//   State<DealsScreen> createState() => _DealsScreenState();
// }

// class _DealsScreenState extends State<DealsScreen> {
//   final SelectCategoryController selectCategoryController = Get.find();

//   late TextEditingController controller;
//   List<CategoryDatum> data = [];
//   @override
//   void initState() {
//     // getCategoryDetails();
//     // controller = TextEditingController();
//     super.initState();
//   }

//   // Future<void> getCategoryDetails() async {
//   //   List<CategoryDatum>? result =
//   // await CategoryRepository().callGetCategoryApi();
//   //   if (result != null) {
//   //     setState(() {
//   //       data = result;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       //  bottomNavigationBar: CommonBottom(selectedIndex: 4),
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
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         //   crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white,
//                                 size: 23,
//                               )),
//                           Text(
//                             "Deals",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           // Image.asset(
//                           //   "assets/splash_screen_bg.png",
//                           //   height: 30,
//                           //   width: 30,
//                           //   //  height: MediaQuery.of(context).size.height - 150,
//                           // ),
//                           const Spacer(),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, MyRouters.profileScreen);
//                             },
//                             child: const CircleAvatar(
//                               radius: 13,
//                               backgroundColor: Colors.white,
//                               child: Icon(Icons.person,
//                                   size: 24, color: Colors.blue),
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
//                       // FilledTextField(
//                       //   hint: 'Search',
//                       //   controller: controller,
//                       // ),
//                       // SearchWidget(),
//                       SizedBox(
//                         height: 90,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 5,
//                               offset: Offset(0, 5),
//                             ),
//                           ],
//                         ),
//                         margin: const EdgeInsets.symmetric(
//                           vertical: 10,
//                         ),
//                         width: MediaQuery.of(context).size.width * 0.6,
//                         height: 43,
//                         child: const Center(
//                           child: Text(
//                             'Best Deals',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const AdBanners(),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 24.0),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Select category',
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Obx(
//                         () {
//                           return Container(
//                             margin: EdgeInsets.symmetric(vertical: 10),
//                             width: MediaQuery.of(context).size.width - 70,
//                             child: Wrap(
//                               clipBehavior: Clip.antiAlias,
//                               alignment: WrapAlignment.spaceBetween,
//                               runSpacing: 10,
//                               textDirection: TextDirection.ltr,
//                               verticalDirection: VerticalDirection.down,
//                               // spacing: 40,
//                               children: List.generate(
//                                 // data.length,
//                                 // 7,
//                                 selectCategoryController.categories.length,
//                                 (index) => Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 13.0),
//                                   child: SizedBox(
//                                     width: 130,
//                                     height: 40,
//                                     child: CustomFilledButton(
//                                       borderRadius: 15,
//                                       onPressed: () {},
//                                       child: Text(
//                                         "${selectCategoryController.categories[index].name}",
//                                         // "${data[index].name}",
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 24.0),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Daily Deals',
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 7),
//                       SizedBox(
//                         height: 200,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: data.length,
//                           itemBuilder: (context, i) {
//                             return GestureDetector(
//                               onTap: () {
//                                 Navigator.pushNamed(
//                                     context, MyRouters.dealsProductDetailsPage);
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => ProductDetails(
//                                 //      categoryDatum: data[i],
//                                 //       // results: results,
//                                 //     ),
//                                 //   ),
//                                 // );
//                                 //   ToastHelper.showToast("message");
//                               },
//                               child: Container(
//                                 width: 182,
//                                 height: 138,
//                                 margin: EdgeInsets.only(
//                                   left: i == 0 ? 0 : 10,
//                                   right: i == 4 ? 0 : 10,
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     Positioned(
//                                       left: 3,
//                                       top: 18,
//                                       child: Container(
//                                         width: 175,
//                                         height: 130,
//                                         decoration: ShapeDecoration(
//                                           color: primaryColor,
//                                           // color:  Color(0xFF74B9FF),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                           ),
//                                         ),
//                                         child: Align(
//                                           alignment: const Alignment(0, 0.9),
//                                           child: Text('${data[i].name}'),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 0,
//                                       top: 0,
//                                       child: Container(
//                                         width: 182,
//                                         height: 117,
//                                         decoration: ShapeDecoration(
//                                           // color:  Color(0xFFD9D9D9),
//                                           image: DecorationImage(
//                                             image: NetworkImage(
//                                                 "${data[i].image}"
//                                                 // 'https://source.unsplash.com/random',
//                                                 ),
//                                             fit: BoxFit.cover,
//                                           ),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(22),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
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
