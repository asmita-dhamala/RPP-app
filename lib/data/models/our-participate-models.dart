// class OurParticipleModel {
//   final String type;
//   final String name;
//   final OurParticipleContent model;
//   final String component;
//   final bool open;
//   final bool isContainer;

//   OurParticipleModel({
//     required this.type,
//     required this.name,
//     required this.model,
//     required this.component,
//     required this.open,
//     required this.isContainer,
//   });

//   factory OurParticipleModel.fromJson(Map<String, dynamic> json) {
//     return OurParticipleModel(
//       type: json['type'] ?? '',
//       name: json['name'] ?? '',
//       model: OurParticipleContent.fromJson(json['model']),
//       component: json['component'] ?? '',
//       open: json['open'] ?? false,
//       isContainer: json['is_container'] ?? false,
//     );
//   }
// }

// class OurParticipleContent {
//   final int avatarImage;
//   final List<Map<String, dynamic>> listItem;

//   OurParticipleContent({
//     required this.avatarImage,
//     required this.listItem,
//   });

//   factory OurParticipleContent.fromJson(Map<String, dynamic> json) {
//     return OurParticipleContent(
//       avatarImage: json['avatar_image'] ?? 0,
//       listItem: (json['list_item'] as List<dynamic>?)
//               ?.map((e) => Map<String, dynamic>.from(e))
//               .toList() ??
//           [],
//     );
//   }
// }
