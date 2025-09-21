// lib/data/models/list_news_model.dart

class ListNewsBlockModel {
  final String type; // "list_news"
  final String name; // "News: List Items"
  final ListNewsModel model;
  final String component; // "RegularBlock"
  final bool open;
  final bool isContainer;

  ListNewsBlockModel({
    required this.type,
    required this.name,
    required this.model,
    required this.component,
    required this.open,
    required this.isContainer,
  });

  factory ListNewsBlockModel.fromJson(Map<String, dynamic> json) {
    return ListNewsBlockModel(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      model: ListNewsModel.fromJson(json['model'] ?? {}),
      component: json['component'] ?? '',
      open: json['open'] ?? false,
      isContainer: json['is_container'] ?? false,
    );
  }

  // bool get isEmpty => null;
}

class ListNewsModel {
  final String style;
  final String title;
  final String headerAlign;
  final String desc;
  final int number;
  final int categoryId;
  final String order;
  final String orderBy;
  final String linkTitle;
  final String linkMore;
  final List<NewsData> data;

  ListNewsModel({
    required this.style,
    required this.title,
    required this.headerAlign,
    required this.desc,
    required this.number,
    required this.categoryId,
    required this.order,
    required this.orderBy,
    required this.linkTitle,
    required this.linkMore,
    required this.data,
  });

  factory ListNewsModel.fromJson(Map<String, dynamic> json) {
    return ListNewsModel(
      style: json['style'] ?? '',
      title: json['title'] ?? '',
      headerAlign: json['header_align'] ?? '',
      desc: json['desc'] ?? '',
      number: json['number'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      order: json['order'] ?? '',
      orderBy: json['order_by'] ?? '',
      linkTitle: json['link_title'] ?? '',
      linkMore: json['link_more'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((item) => NewsData.fromJson(item))
          .toList(),
    );
  }
}

class NewsData {
  final int id;
  final String slug;
  final String title;
  final String content;
  final int imageId;
  final String imageUrl;
  final String imageHtml;
  final int categoryId;
  final String categoryName;
  final String categorySlug;
  final String createdAt;
  final String authorAvatarUrl;
  final String authorName;
  final String url;

  NewsData({
    required this.id,
    required this.slug,
    required this.title,
    required this.content,
    required this.imageId,
    required this.imageUrl,
    required this.imageHtml,
    required this.categoryId,
    required this.categoryName,
    required this.categorySlug,
    required this.createdAt,
    required this.authorAvatarUrl,
    required this.authorName,
    required this.url,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      id: json['id'] ?? 0,
      slug: json['slug'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      imageId: json['image_id'] ?? 0,
      imageUrl: json['image_url'] ?? '',
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
