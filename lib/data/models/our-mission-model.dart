
// abstract class ContentModel {
//   factory ContentModel.fromJson(Map<String, dynamic> json, String type) {
//     switch (type) {
//       case 'Sliderv2':
//         return SliderModel.fromJson(json);
//       case 'contentv2':
//         return ContentV2Model.fromJson(json);
//       default:
//         throw Exception('Unsupported content type: $type');
//     }
//   }
// }

// class ContentBlock {
//   final String type;
//   final String name;
//   final ContentModel model;
//   final String component;
//   final bool open;
//   final bool isContainer;

//   ContentBlock({
//     required this.type,
//     required this.name,
//     required this.model,
//     required this.component,
//     required this.open,
//     required this.isContainer,
//   });

//   factory ContentBlock.fromJson(Map<String, dynamic> json) {
//     return ContentBlock(
//       type: json['type'] ?? '',
//       name: json['name'] ?? '',
//       model: ContentModel.fromJson(json['model'] ?? {}, json['type'] ?? ''),
//       component: json['component'] ?? '',
//       open: json['open'] ?? false,
//       isContainer: json['is_container'] ?? false,
//     );
//   }
// }

// // ----------------- Sliderv2 Model -----------------

// class SliderModel implements ContentModel {
//   final String title;
//   final List<SliderItem> listItems;

//   SliderModel({
//     required this.title,
//     required this.listItems,
//   });

//   factory SliderModel.fromJson(Map<String, dynamic> json) {
//     final list = json['list_item'] as List<dynamic>? ?? [];
//     final items = list.map((e) => SliderItem.fromJson(e)).toList();

//     return SliderModel(
//       title: json['title'] ?? '',
//       listItems: items,
//     );
//   }
// }

// class SliderItem {
//   final bool active;
//   final String title;
//   final String description;
//   final int avatar;
//   final String readMoreLink;
//   final String readMoreText;
//   final String readMoreLink2;
//   final String readMoreText2;

//   SliderItem({
//     required this.active,
//     required this.title,
//     required this.description,
//     required this.avatar,
//     required this.readMoreLink,
//     required this.readMoreText,
//     required this.readMoreLink2,
//     required this.readMoreText2,
//   });

//   factory SliderItem.fromJson(Map<String, dynamic> json) {
//     return SliderItem(
//       active: json['_active'] ?? false,
//       title: json['title'] ?? '',
//       description: json['description'] ?? '',
//       avatar: json['avatar'] ?? 0,
//       readMoreLink: json['read_more_link'] ?? '',
//       readMoreText: json['read_more_text'] ?? '',
//       readMoreLink2: json['read_more_link2'] ?? '',
//       readMoreText2: json['read_more_text2'] ?? '',
//     );
//   }
// }

// // ----------------- ContentV2 Model -----------------

// class ContentV2Model implements ContentModel {
//   final String title;
//   final String description;
//   final int image;
//   final String buttonText;
//   final String buttonLink;

//   ContentV2Model({
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.buttonText,
//     required this.buttonLink,
//   });

//   factory ContentV2Model.fromJson(Map<String, dynamic> json) {
//     return ContentV2Model(
//       title: json['title'] ?? '',
//       description: json['description'] ?? '',
//       image: json['image'] ?? 0,
//       buttonText: json['button_text'] ?? '',
//       buttonLink: json['button_link'] ?? '',
//     );
//   }
// }
