
class VideoPageModel {
  final int total;
  final int totalPages;
  final List<VideoData> data;
  final int status;

  VideoPageModel({
    required this.total,
    required this.totalPages,
    required this.data,
    required this.status,
  });

  factory VideoPageModel.fromJson(Map<String, dynamic> json) {
    return VideoPageModel(
      total: json['total'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => VideoData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] ?? 0,
    );
  }
}

class VideoData {
  final int id;
  final String slug;
  final String title;
  final List<VideoListItem> videoList;
  final String? publisherImageId;
  final String? publisher;
  final String? gallery;
  final String? eventDetails;
  final String? content;
  final dynamic imageId; // Sometimes string or int?
  final String? imageUrl;
  final String? imageHtml;
  final int? categoryId;
  final String? categoryName;
  final String? categorySlug;
  final String? createdAt;
  final String? authorAvatarUrl;
  final String? authorName;
  final String? url;

  VideoData({
    required this.id,
    required this.slug,
    required this.title,
    required this.videoList,
    this.publisherImageId,
    this.publisher,
    this.gallery,
    this.eventDetails,
    this.content,
    this.imageId,
    this.imageUrl,
    this.imageHtml,
    this.categoryId,
    this.categoryName,
    this.categorySlug,
    this.createdAt,
    this.authorAvatarUrl,
    this.authorName,
    this.url,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      id: json['id'] ?? 0,
      slug: json['slug'] ?? '',
      title: json['title'] ?? '',
      videoList: (json['video_list'] as List<dynamic>? ?? [])
          .map((e) => VideoListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      publisherImageId: json['publisher_image_id'],
      publisher: json['publisher'],
      gallery: json['gallery'],
      eventDetails: json['event_details'],
      content: json['content'],
      imageId: json['image_id'],
      imageUrl: json['image_url'],
      imageHtml: json['image_html'],
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      categorySlug: json['category_slug'],
      createdAt: json['created_at'],
      authorAvatarUrl: json['author_avatar_url'],
      authorName: json['author_name'],
      url: json['url'],
    );
  }
}

class VideoListItem {
  final String title;
  final String? desc;
  final String content;

  VideoListItem({
    required this.title,
    this.desc,
    required this.content,
  });

  factory VideoListItem.fromJson(Map<String, dynamic> json) {
    return VideoListItem(
      title: json['title'] ?? '',
      desc: json['desc'],
      content: json['content'] ?? '',
    );
  }
}
