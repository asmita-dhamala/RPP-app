class PhotoGalleryItem {
  final int id;
  final String slug;
  final String title;
  final String linkUrl;
  final String publisher;
  final List<int> galleryIds;
  final int imageId;
  final String imageUrl;
  final String url;
  final String categoryName;  // new field

  PhotoGalleryItem({
    required this.id,
    required this.slug,
    required this.title,
    required this.linkUrl,
    required this.publisher,
    required this.galleryIds,
    required this.imageId,
    required this.imageUrl,
    required this.url,
    required this.categoryName,  // new field
  });

  factory PhotoGalleryItem.fromJson(Map<String, dynamic> json) {
    // gallery is comma-separated string, convert to int list
    final galleryString = json['gallery'] as String? ?? '';
    final galleryIds = galleryString
        .split(',')
        .where((e) => e.trim().isNotEmpty)
        .map((e) => int.tryParse(e.trim()) ?? 0)
        .where((id) => id != 0)
        .toList();

    return PhotoGalleryItem(
      id: json['id'] ?? 0,
      slug: json['slug'] ?? '',
      title: json['title'] ?? '',
      linkUrl: json['link_url'] ?? '',
      publisher: json['publisher'] ?? '',
      galleryIds: galleryIds,
      imageId: json['image_id'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      url: json['url'] ?? '',
      categoryName: json['category_name'] ?? '',  // parse here
    );
  }
}

class PhotoGalleryResponse {
  final int total;
  final int totalPages;
  final List<PhotoGalleryItem> data;

  PhotoGalleryResponse({
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory PhotoGalleryResponse.fromJson(Map<String, dynamic> json) {
    final items = (json['data'] as List<dynamic>? ?? [])
        .map((e) => PhotoGalleryItem.fromJson(e))
        .toList();

    return PhotoGalleryResponse(
      total: json['total'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      data: items,
    );
  }
}
