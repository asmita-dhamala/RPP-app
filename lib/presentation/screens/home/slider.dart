// import 'package:flutter/material.dart';
// import 'package:flutter_swiper_view/flutter_swiper_view.dart';
// import 'package:raparva_app/core/constants/app_color.dart';

// class CustomImageSlider extends StatefulWidget {
//   const CustomImageSlider({super.key});

//   @override
//   _CustomImageSliderState createState() => _CustomImageSliderState();
// }

// class _CustomImageSliderState extends State<CustomImageSlider> {
//   final List<Map<String, dynamic>> sliderData = [
//     {
//       'image': 'assets/images/slider1.jpg',
//       'title': 'GIVE A MISSED CALL ON',
//       'phone': '88 00 00 2025',
//       'subtitle': 'AND BECOME A PART OF THE',
//       'partyName': 'Rastriya Prajatantra Party',
//       'gradient': [themeyellow.withOpacity(0.8), themeyellow.withOpacity(0.4)],
//       'primaryColor': themeyellow,
//     },
//     {
//       'image': 'assets/images/slider2.jpg',
//       'title': 'JOIN THE MOVEMENT FOR',
//       'phone': '88 00 00 2025',
//       'subtitle': 'PROGRESS AND DEVELOPMENT',
//       'partyName': 'Rastriya Prajatantra Party',
//       'gradient': [themered.withOpacity(0.8), themered.withOpacity(0.4)],
//       'primaryColor': themered,
//     },
//     {
//       'image': 'assets/images/slider3.jpg',
//       'title': 'BE PART OF THE CHANGE',
//       'phone': '88 00 00 2025',
//       'subtitle': 'FOR A BETTER TOMORROW',
//       'partyName': 'Rastriya Prajatantra Party',
//       'gradient': [themeblue.withOpacity(0.8), themeblue.withOpacity(0.4)],
//       'primaryColor': themeblue,
//     },
//     {
//       'image': 'assets/images/slider4.jpg',
//       'title': 'VOTE FOR DEVELOPMENT',
//       'phone': '88 00 00 2025',
//       'subtitle': 'BUILD A STRONGER NATION',
//       'partyName': 'Rastriya Prajatantra Party',
//       'gradient': [
//         const Color.fromARGB(255, 176, 39, 71).withOpacity(0.8),
//         const Color.fromARGB(255, 53, 19, 224).withOpacity(0.4),
//       ],
//       'primaryColor': const Color.fromARGB(255, 176, 39, 71),
//     },
//   ];

//   int _currentIndex = 0;

//   Widget _buildSlideContent(Map<String, dynamic> slideData) {
//     return Container(
//       decoration: BoxDecoration(
//        // borderRadius: BorderRadius.circular(20),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: slideData['gradient'],
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             // blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         // borderRadius: BorderRadius.circular(20),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               slideData['image'],
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: Colors.grey.shade300,
//                   child: const Icon(
//                     Icons.image_not_supported,
//                     size: 50,
//                     color: Colors.white,
//                   ),
//                 );
//               },
//             ),
//             // Container(
//             //   decoration: BoxDecoration(
//             //     gradient: LinearGradient(
//             //       colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
//             //       begin: Alignment.topCenter,
//             //       end: Alignment.bottomCenter,
//             //     ),
//             //   ),
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.all(20),
//             //   child: Column(
//             //     children: [
//             //       Container(
//             //         width: 70,
//             //         height: 70,
//             //         decoration: BoxDecoration(
//             //           color: slideData['primaryColor'],
//             //           shape: BoxShape.circle,
//             //           border: Border.all(color: Colors.white, width: 3),
//             //           boxShadow: [
//             //             BoxShadow(
//             //               color: slideData['primaryColor'].withOpacity(0.3),
//             //               blurRadius: 10,
//             //               offset: Offset(0, 5),
//             //             ),
//             //           ],
//             //         ),
//             //         child: Column(
//             //           mainAxisAlignment: MainAxisAlignment.center,
//             //           children: [
//             //             Text(
//             //               'RPP',
//             //               style: TextStyle(
//             //                 color: Colors.white,
//             //                 fontWeight: FontWeight.bold,
//             //               ),
//             //             ),
//             //             Text(
//             //               '2025',
//             //               style: TextStyle(color: Colors.white, fontSize: 12),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       const SizedBox(height: 20),
//             //       Text(
//             //         slideData['title'],
//             //         textAlign: TextAlign.center,
//             //         style: TextStyle(
//             //           color: Colors.white,
//             //           fontSize: 18,
//             //           fontWeight: FontWeight.bold,
//             //         ),
//             //       ),
//             //       const SizedBox(height: 10),
//             //       Container(
//             //         padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//             //         decoration: BoxDecoration(
//             //           color: Colors.white,
//             //           borderRadius: BorderRadius.circular(30),
//             //         ),
//             //         child: Row(
//             //           mainAxisSize: MainAxisSize.min,
//             //           children: [
//             //             Icon(
//             //               Icons.phone,
//             //               color: slideData['primaryColor'],
//             //               size: 18,
//             //             ),
//             //             const SizedBox(width: 10),
//             //             Text(
//             //               slideData['phone'],
//             //               style: TextStyle(
//             //                 color: slideData['primaryColor'],
//             //                 fontWeight: FontWeight.bold,
//             //                 fontSize: 20,
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       const SizedBox(height: 12),
//             //       Text(
//             //         slideData['subtitle'],
//             //         textAlign: TextAlign.center,
//             //         style: TextStyle(color: Colors.white, fontSize: 13),
//             //       ),
//             //       const SizedBox(height: 12),
//             //       Container(
//             //         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             //         decoration: BoxDecoration(
//             //           color: slideData['primaryColor'],
//             //           borderRadius: BorderRadius.circular(30),
//             //         ),
//             //         child: Text(
//             //           slideData['partyName'],
//             //           style: TextStyle(
//             //             color: Colors.white,
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //       ),
//             //       // Spacer() hata diya yahan se
//             //       const SizedBox(height: 30), // Button se thoda gap dene ke liye

//             //       SizedBox(
//             //         width: double.infinity,
//             //         child: ElevatedButton(
//             //           onPressed: () {
//             //             ScaffoldMessenger.of(context).showSnackBar(
//             //               SnackBar(
//             //                 content: Text(
//             //                   'Joining ${slideData['partyName']}...',
//             //                 ),
//             //                 backgroundColor: slideData['primaryColor'],
//             //                 behavior: SnackBarBehavior.floating,
//             //               ),
//             //             );
//             //           },
//             //           style: ElevatedButton.styleFrom(
//             //             backgroundColor: slideData['primaryColor'],
//             //             foregroundColor: Colors.white,
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(30),
//             //             ),
//             //           ),
//             //           child: Text(
//             //             'JOIN NOW',
//             //             style: TextStyle(letterSpacing: 1),
//             //           ),
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double sliderHeight = MediaQuery.of(context).size.height * 0.50;
//     final double sliderWidth =
//         MediaQuery.of(context).size.width; // Full screen width, no margin

//     return Column(
//       children: [
//         SizedBox(
//           height: sliderHeight,
//           width: sliderWidth, // full width, no margin
//           child: Swiper(
//             itemCount: sliderData.length,
//             itemBuilder:
//                 (context, index) => _buildSlideContent(sliderData[index]),
//             viewportFraction: 1.0, // FULL WIDTH horizontally
//             scale: 1.0, // NO shrinking
//             autoplay: true,
//             autoplayDelay: 4000,
//             duration: 800,
//             pagination: SwiperPagination(
//               builder: DotSwiperPaginationBuilder(
//                 activeColor: sliderData[_currentIndex]['primaryColor'],
//                 color: Colors.grey[300]!,
//                 size: 9,
//                 activeSize: 15,
//               ),
//             ),
//             onIndexChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             control: SwiperControl(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               color: sliderData[_currentIndex]['primaryColor'],
//               size: 0,
//             ),
//             loop: true, // Enable looping
//             physics: const BouncingScrollPhysics(), // Smooth scrolling
//           ),
//         ),
//         const SizedBox(height: 12),
//       ],
//     );
//   }
// }
