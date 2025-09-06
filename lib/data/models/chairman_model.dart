class StaticBanner {
  final String type;
  final String name;
  final StaticBannerModel model;
  final String component;
  final bool open;
  final bool isContainer;

  StaticBanner({
    required this.type,
    required this.name,
    required this.model,
    required this.component,
    required this.open,
    required this.isContainer,
  });

  factory StaticBanner.fromJson(Map<String, dynamic> json) {
    return StaticBanner(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      model: StaticBannerModel.fromJson(json['model'] ?? {}),
      component: json['component'] ?? '',
      open: json['open'] ?? false,
      isContainer: json['is_container'] ?? false,
    );
  }
}

class StaticBannerModel {
  final List<StaticBannerItem> listItem;

  StaticBannerModel({required this.listItem});

  factory StaticBannerModel.fromJson(Map<String, dynamic> json) {
    final list = json['list_item'] as List<dynamic>? ?? [];
    return StaticBannerModel(
      listItem: list.map((e) => StaticBannerItem.fromJson(e)).toList(),
    );
  }
}

class StaticBannerItem {
  final bool isActive;
  final String title;
  final String subtitle;
  final String description;
  final int avatar;
  final String readMoreLink;
  final String readMoreText;
  final String readMoreLink2;
  final String readMoreText2;

  StaticBannerItem({
    required this.isActive,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.avatar,
    required this.readMoreLink,
    required this.readMoreText,
    required this.readMoreLink2,
    required this.readMoreText2,
  });

  factory StaticBannerItem.fromJson(Map<String, dynamic> json) {
    return StaticBannerItem(
      isActive: json['_active'] ?? false,
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      avatar: json['avatar'] ?? 0,
      readMoreLink: json['read_more_link'] ?? '',
      readMoreText: json['read_more_text'] ?? '',
      readMoreLink2: json['read_more_link_2'] ?? '',
      readMoreText2: json['read_more_text_2'] ?? '',
    );
  }

  String get avatarUrl =>
      'https://rpp.org.np/media/preview/$avatar/thumb';
}
