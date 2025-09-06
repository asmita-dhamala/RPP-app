// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:raparva_app/data/models/photo_gallery_model.dart';
// import 'package:raparva_app/presentation/screens/home/all_home_card_screen/photo_viewer_screen.dart'; 

 


// class GalleryListingPage extends StatefulWidget {
//   @override
//   _GalleryListingPageState createState() => _GalleryListingPageState();
// }

// class _GalleryListingPageState extends State<GalleryListingPage> {
//   List<GalleryItem> galleries = [];
//   bool isLoading = true;
//   bool isLoadingMore = false;
//   int currentPage = 1;
//   bool hasMoreData = true;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _loadGalleries();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
//       if (hasMoreData && !isLoadingMore) {
//         _loadMoreGalleries();
//       }
//     }
//   }

//   Future<void> _loadGalleries() async {
//     setState(() {
//       isLoading = true;
//       currentPage = 1;
//       galleries.clear();
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://rpp.org.np/api/news?cat_id=10&page=$currentPage'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> galleryData = data['data'] ?? [];
        
//         setState(() {
//           galleries = galleryData.map((item) => GalleryItem.fromJson(item)).toList();
//           isLoading = false;
//           hasMoreData = galleryData.length > 0;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       _showErrorSnackbar('Failed to load galleries');
//     }
//   }

//   Future<void> _loadMoreGalleries() async {
//     setState(() {
//       isLoadingMore = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://rpp.org.np/api/news?cat_id=10&page=${currentPage + 1}'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> galleryData = data['data'] ?? [];
        
//         setState(() {
//           if (galleryData.isNotEmpty) {
//             galleries.addAll(galleryData.map((item) => GalleryItem.fromJson(item)).toList());
//             currentPage++;
//           }
//           hasMoreData = galleryData.length > 0;
//           isLoadingMore = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isLoadingMore = false;
//       });
//       _showErrorSnackbar('Failed to load more galleries');
//     }
//   }

//   void _showErrorSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF8F9FA),
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 120.0,
//             floating: false,
//             pinned: true,
//             elevation: 0,
//             backgroundColor: Color(0xFF2196F3),
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 'Photo Gallery',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22,
//                 ),
//               ),
//               centerTitle: true,
//               background: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0xFF2196F3),
//                       Color(0xFF1976D2),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.refresh, color: Colors.white),
//                 onPressed: _loadGalleries,
//               ),
//             ],
//           ),
//           if (isLoading)
//             SliverFillRemaining(
//               child: Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
//                 ),
//               ),
//             )
//           else if (galleries.isEmpty)
//             SliverFillRemaining(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.photo_library_outlined,
//                       size: 64,
//                       color: Colors.grey[400],
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'No galleries found',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           else
//             SliverPadding(
//               padding: EdgeInsets.all(16.0),
//               sliver: SliverGrid(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.75,
//                   crossAxisSpacing: 16.0,
//                   mainAxisSpacing: 16.0,
//                 ),
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     if (index < galleries.length) {
//                       return GalleryCard(
//                         gallery: galleries[index],
//                         onTap: () => _navigateToGalleryDetail(galleries[index]),
//                       );
//                     } else if (isLoadingMore) {
//                       return Center(
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
//                         ),
//                       );
//                     }
//                     return null;
//                   },
//                   childCount: galleries.length + (isLoadingMore ? 1 : 0),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   void _navigateToGalleryDetail(GalleryItem gallery) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => GalleryDetailPage(
//           galleryId: gallery.id,
//           galleryTitle: gallery.title,
//         ),
//       ),
//     );
//   }
// }

// class GalleryCard extends StatefulWidget {
//   final GalleryItem gallery;
//   final VoidCallback onTap;

//   GalleryCard({required this.gallery, required this.onTap});

//   @override
//   _GalleryCardState createState() => _GalleryCardState();
// }

// class _GalleryCardState extends State<GalleryCard> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       onTapDown: (_) => _animationController.forward(),
//       onTapUp: (_) => _animationController.reverse(),
//       onTapCancel: () => _animationController.reverse(),
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 8,
//                 spreadRadius: 2,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     width: double.infinity,
//                     child: CachedNetworkImage(
//                       imageUrl: widget.gallery.imageUrl,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => Container(
//                         color: Colors.grey[200],
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
//                           ),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         color: Colors.grey[200],
//                         child: Icon(
//                           Icons.image_not_supported,
//                           color: Colors.grey[400],
//                           size: 40,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: EdgeInsets.all(12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.gallery.title,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.access_time,
//                               size: 12,
//                               color: Colors.grey[600],
//                             ),
//                             SizedBox(width: 4),
//                             Expanded(
//                               child: Text(
//                                 widget.gallery.createdAt,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey[600],
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GalleryDetailPage extends StatefulWidget {
//   final int galleryId;
//   final String galleryTitle;

//   GalleryDetailPage({required this.galleryId, required this.galleryTitle});

//   @override
//   _GalleryDetailPageState createState() => _GalleryDetailPageState();
// }

// class _GalleryDetailPageState extends State<GalleryDetailPage> {
//   List<GalleryDetailItem> images = [];
//   bool isLoading = true;
//   Map<String, dynamic>? galleryData;

//   @override
//   void initState() {
//     super.initState();
//     _loadGalleryDetail();
//   }

//   Future<void> _loadGalleryDetail() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://rpp.org.np/api/news/${widget.galleryId}'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         galleryData = data['data'];
        
//         // Parse gallery images from the response
//         // Assuming the gallery field contains image references
//         List<GalleryDetailItem> galleryImages = [];
        
//         // Example parsing - adjust based on actual API response structure
//         if (galleryData != null && galleryData!['gallery'] != null) {
//           // Parse gallery data to extract image URLs
//           // This is a placeholder - you'll need to adjust based on actual API response
//           String galleryContent = galleryData!['gallery'] ?? '';
          
//           // For demonstration, creating sample images
//           // Replace this with actual parsing logic
//           for (int i = 1; i <= 5; i++) {
//             galleryImages.add(GalleryDetailItem(
//               title: 'Image $i',
//               imageUrl: 'https://rpp.org.np/media/preview/sample$i/large',
//               description: 'Gallery image $i description',
//             ));
//           }
//         }

//         setState(() {
//           images = galleryImages;
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       _showErrorSnackbar('Failed to load gallery details');
//     }
//   }

//   void _showErrorSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   void _openPhotoViewer(int initialIndex) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PhotoViewerPage(
//           images: images,
//           initialIndex: initialIndex,
//           galleryTitle: widget.galleryTitle,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF8F9FA),
//       appBar: AppBar(
//         title: Text(
//           widget.galleryTitle,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         backgroundColor: Color(0xFF2196F3),
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
//               ),
//             )
//           : images.isEmpty
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.photo_library_outlined,
//                         size: 64,
//                         color: Colors.grey[400],
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         'No images found',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(16),
//                       color: Colors.white,
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.photo_library,
//                             color: Color(0xFF2196F3),
//                             size: 20,
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             '${images.length} Photos',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: GridView.builder(
//                         padding: EdgeInsets.all(16),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 1.0,
//                           crossAxisSpacing: 16.0,
//                           mainAxisSpacing: 16.0,
//                         ),
//                         itemCount: images.length,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () => _openPhotoViewer(index),
//                             child: Hero(
//                               tag: 'image_$index',
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.1),
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2),
//                                     ),
//                                   ],
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(12),
//                                   child: CachedNetworkImage(
//                                     imageUrl: images[index].imageUrl,
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => Container(
//                                       color: Colors.grey[200],
//                                       child: Center(
//                                         child: CircularProgressIndicator(
//                                           valueColor: AlwaysStoppedAnimation<Color>(
//                                               Color(0xFF2196F3)),
//                                         ),
//                                       ),
//                                     ),
//                                     errorWidget: (context, url, error) => Container(
//                                       color: Colors.grey[200],
//                                       child: Icon(
//                                         Icons.image_not_supported,
//                                         color: Colors.grey[400],
//                                         size: 40,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//     );
//   }
// }
 