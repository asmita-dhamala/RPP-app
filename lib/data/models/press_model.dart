
import '../../core/utils/api_helper.dart';

class PressReleaseModel {
  final int id;
  final String slug;
  final String title;
  // final String linkUrl;
  final dynamic videoList;
  final String publisherImageId;
  final String publisher;
  final String gallery;
  final String eventDetails;
  final String content;
  final int imageId;
  final String imageHtml;
  final int categoryId;
  final String categoryName;
  final String categorySlug;
  final String createdAt;
  final String authorAvatarUrl;
  final String authorName;
  final String url;

  // Computed property
  String get imageUrl => getSliderThumbUrl(imageId);

  PressReleaseModel({
    required this.id,
    required this.slug,
    required this.title,
    // required this.linkUrl,
    required this.videoList,
    required this.publisherImageId,
    required this.publisher,
    required this.gallery,
    required this.eventDetails,
    required this.content,
    required this.imageId,
    required this.imageHtml,
    required this.categoryId,
    required this.categoryName,
    required this.categorySlug,
    required this.createdAt,
    required this.authorAvatarUrl,
    required this.authorName,
    required this.url,
  });

  factory PressReleaseModel.fromJson(Map<String, dynamic> json) {
    return PressReleaseModel(
      id: json['id'] ?? 0,
      slug: json['slug'] ?? '',
      title: json['title'] ?? '',
      // linkUrl: json['link_url'] ?? '',
      videoList: json['video_list'],
      publisherImageId: json['publisher_image_id'] ?? '',
      publisher: json['publisher'] ?? '',
      gallery: json['gallery'] ?? '',
      eventDetails: json['event_details'] ?? '',
      content: json['content'] ?? '',
      imageId: json['image_id'] ?? 0,
      imageHtml: json['image_html'] ?? '',
      categoryId: json['category_id'] ?? 0,
      categoryName: json['category_name'] ?? '',
      categorySlug: json['category_slug'] ?? '',
      createdAt: json['created_at'] ?? '',
      authorAvatarUrl: json['author_avatar_url'] ?? '',
      authorName: json['author_name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}







