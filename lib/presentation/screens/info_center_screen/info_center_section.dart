import 'package:flutter/material.dart';
import 'package:raparva_app/core/constants/app_color.dart';
import 'package:raparva_app/data/models/info_center_model.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/calender.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/documents.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/notice.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/press.dart';

class InfoCenterContent extends StatelessWidget {
  final InfoCenterModel data;

  const InfoCenterContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final items = data.listItems.where((e) => e.active).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              data.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        GridView.builder(
          padding: const EdgeInsets.all(12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () => _handleBoxTap(context, item),
              child: Container(
                decoration: BoxDecoration(
                color: themeyellow,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item.avatar != 0)
                      Image.network(
                        item.imageUrl,
                        width: 48,
                        height: 48,
                        errorBuilder:
                            (_, __, ___) =>
                                const Icon(Icons.image_not_supported),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themered,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _handleBoxTap(BuildContext context, InfoCenterItem item) {
    switch (item.title.trim()) {
      case 'दस्तावेज':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => InfoCardDocuments(item: item)),
        );
        break;
      case 'प्रेस विज्ञप्ति':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => InfoCardPress(item: item)),
        );
        break;
      case 'सूचना':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => InfoCardNotice(item: item)),
        );
        break;
      case 'कार्यक्रम':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => InfoCardCalendar(item: item)),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No screen mapped for this box")),
        );
    }
  }
}

// /// Utility for using hex color from API (like "#FF0000")
// class HexColor extends Color {
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

//   static int _getColorFromHex(String hexColor) {
//     final hex = hexColor.replaceAll("#", "");
//     return int.parse('FF$hex', radix: 16);
//   }
// }