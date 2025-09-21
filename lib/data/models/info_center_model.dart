class InfoCenterModel {
  final String title;
  final String desc;
  final String style;
  final List<InfoCenterItem> listItems;

  InfoCenterModel({
    required this.title,
    required this.desc,
    required this.style,
    required this.listItems,
  });

  factory InfoCenterModel.fromJson(Map<String, dynamic> json) {
    final model = json['model'] ?? {};
    final itemsJson = model['list_item'] as List<dynamic>? ?? [];

    return InfoCenterModel(
      title: model['title'] ?? '',
      desc: model['desc'] ?? '',
      style: model['style'] ?? '',
      listItems: itemsJson
          .map((item) => InfoCenterItem.fromJson(item))
          .toList(),
    );
  }
}

class InfoCenterItem {
  final bool active;
  final String title;
  final String color;
  // final String link;
  final int avatar;
  final String icon;
  final String textColor;
  final String hoverColor;
  final String desc;

  InfoCenterItem({
    required this.active,
    required this.title,
    required this.color,
    // required this.link,
    required this.avatar,
    required this.icon,
    required this.textColor,
    required this.hoverColor,
    required this.desc,
  });

  /// Computed image URL from avatar ID
  String get imageUrl => 'https://rpp.org.np/media/preview/$avatar/thumb';

  factory InfoCenterItem.fromJson(Map<String, dynamic> json) {
    return InfoCenterItem(
      active: json['_active'] ?? false,
      title: json['title'] ?? '',
      color: json['color'] ?? '',
      // link: json['link'] ?? '',
      avatar: json['avatar'] ?? 0,
      icon: json['icon'] ?? '',
      textColor: json['text-color'] ?? '',
      hoverColor: json['hover-color'] ?? '',
      desc: json['desc'] ?? '',
    );
  }

  // get type => null;
}





















