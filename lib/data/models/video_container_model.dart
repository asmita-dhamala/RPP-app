class VideoContainerModel {
  final String type;
  final String name;
  final String component;
  final bool open;
  final bool isContainer;
  final VideoContainerV2 model;

  VideoContainerModel({
    required this.type,
    required this.name,
    required this.component,
    required this.open,
    required this.isContainer,
    required this.model,
  });

  factory VideoContainerModel.fromJson(Map<String, dynamic> json) {
    return VideoContainerModel(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      component: json['component'] ?? '',
      open: json['open'] ?? false,
      isContainer: json['is_container'] ?? false,
      model: VideoContainerV2.fromJson(json['model'] ?? {}),
    );
  }
}

class VideoContainerV2 {
  final String style;
  final String title;
  final String desc;
  final String youtube;
  final int bgImage;
  final String bgImageUrl;
  final List<VideoItem> listItem;

  VideoContainerV2({
    required this.style,
    required this.title,
    required this.desc,
    required this.youtube,
    required this.bgImage,
    required this.bgImageUrl,
    required this.listItem,
  });

  factory VideoContainerV2.fromJson(Map<String, dynamic> json) {
    return VideoContainerV2(
      style: json['style'] ?? '',
      title: json['title'] ?? '',
      desc: json['desc'] ?? '',
      youtube: json['youtube'] ?? '',
      bgImage: json['bg_image'] ?? 0,
      bgImageUrl: json['bg_image_url'] ?? '',
      listItem: (json['list_item'] as List<dynamic>?)
              ?.map((e) => VideoItem.fromJson(e))
              .toList() ??
          [],
    );
  }

  String get backgroundImage => bgImageUrl.isNotEmpty
      ? bgImageUrl
      : 'https://rpp.org.np/media/preview/$bgImage/thumb';
}

class VideoItem {
  final bool active;
  final String youtube;
  final String title;
  final String? description;
  final int avatar;
  final String avatarUrl;

  VideoItem({
    required this.active,
    required this.youtube,
    required this.title,
    required this.description,
    required this.avatar,
    required this.avatarUrl,
  });

  String get imageUrl => avatarUrl.isNotEmpty
      ? avatarUrl
      : 'https://rpp.org.np/media/preview/$avatar/thumb';

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      active: json['_active'] ?? false,
      youtube: json['youtube'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      avatar: json['avatar'] ?? 0,
      avatarUrl: json['avatar_url'] ?? '',
    );
  }
}
