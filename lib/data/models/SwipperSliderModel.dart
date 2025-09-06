class SwipperSliderModel {
  final String type;
  final String name;
  final SwipperSliderContent model;
  final String component;
  final bool open;

  SwipperSliderModel({
    required this.type,
    required this.name,
    required this.model,
    required this.component,
    required this.open,
  });

  factory SwipperSliderModel.fromJson(Map<String, dynamic> json) {
    return SwipperSliderModel(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      model: SwipperSliderContent.fromJson(json['model'] ?? {}),
      component: json['component'] ?? '',
      open: json['open'] ?? false,
    );
  }
}

class SwipperSliderContent {
  final String avatarImage;
  final List<SwipperSliderItem> listItem;

  SwipperSliderContent({
    required this.avatarImage,
    required this.listItem,
  });

  factory SwipperSliderContent.fromJson(Map<String, dynamic> json) {
    var items = (json['list_item'] as List<dynamic>? ?? [])
        .map((item) => SwipperSliderItem.fromJson(item))
        .toList();

    return SwipperSliderContent(
      avatarImage: json['avatar_image'] ?? '',
      listItem: items,
    );
  }
}

class SwipperSliderItem {
  final bool active;
  final String? title;
  final String? description;
  final int bgImage;
  final String readMoreLink;
  final String readMoreText;

  SwipperSliderItem({
    required this.active,
    this.title,
    this.description,
    required this.bgImage,
    required this.readMoreLink,
    required this.readMoreText,
  });

  factory SwipperSliderItem.fromJson(Map<String, dynamic> json) {
    // Parse bg_image safely from int or string
    final dynamic rawImage = json['bg_image'];
    int bgImage = 0;
    if (rawImage is int) {
      bgImage = rawImage;
    } else if (rawImage is String && rawImage.isNotEmpty) {
      bgImage = int.tryParse(rawImage) ?? 0;
    }

    return SwipperSliderItem(
      active: json['_active'] ?? false,
      title: json['title'],
      description: json['description'],
      bgImage: bgImage,
      readMoreLink: json['read_more_link'] ?? '',
      readMoreText: json['read_more_text'] ?? '',
    );
  }
}
