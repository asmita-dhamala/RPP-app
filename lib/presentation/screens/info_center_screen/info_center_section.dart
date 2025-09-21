import 'package:flutter/material.dart';
import 'package:raparva_app/data/models/info_center_model.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/calender.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/documents.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/notice.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/press.dart';

class InfoCenterWidget extends StatelessWidget {
  final InfoCenterModel data;
  const InfoCenterWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.listItems.isEmpty) return const SizedBox.shrink();

    final screenWidth = MediaQuery.of(context).size.width;

    final cardWidth = screenWidth * 0.38;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Title Section
        Center(
          child: Column(
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 2,
                width: 120,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // ✅ Horizontal Scroll
        SizedBox(
          height: 220, // slightly smaller
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: data.listItems.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = data.listItems[index];
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => _handleOnTap(context, item.title),
                child: Container(
                  width: cardWidth, // ✅ Responsive width
                  margin: const EdgeInsets.symmetric(vertical: 12), // Top & bottom margin
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08), // ✅ Soft shadow
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ✅ Image/Icon
                      SizedBox(
                        height: 80,
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // ✅ Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _handleOnTap(BuildContext context, String title) {
    switch (title) {
      case 'दस्तावेज':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InfoCardDocuments(item: data.listItems.first),
          ),
        );
        break;
      case 'प्रेस विज्ञप्ति':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InfoCardPress(item: data.listItems.first),
          ),
        );
        break;
      case 'सूचना':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InfoCardNotice(item: data.listItems.first),
          ),
        );
        break;
      case 'कार्यक्रम':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => InfoCardCalendar(item: data.listItems.first),
          ),
        );
        break;
      default:
        debugPrint('Unknown Info Center item tapped: $title');
    }
  }
}
