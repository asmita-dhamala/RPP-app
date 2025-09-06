class AlekhV2Model {
  final String type;
  final String name;
  final AlekhV2Data model;
  final String component;
  final bool open;
  final bool isContainer;

  AlekhV2Model({
    required this.type,
    required this.name,
    required this.model,
    required this.component,
    required this.open,
    required this.isContainer,
  });

  factory AlekhV2Model.fromJson(Map<String, dynamic> json) {
    return AlekhV2Model(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      model: AlekhV2Data.fromJson(json['model'] ?? {}),
      component: json['component'] ?? '',
      open: json['open'] ?? false,
      isContainer: json['is_container'] ?? false,
    );
  }
}

class AlekhV2Data {
  final String title;
  final List<Article> articles;
  final String showAllText;
  final String backText;

  AlekhV2Data({
    required this.title,
    required this.articles,
    required this.showAllText,
    required this.backText,
  });

  factory AlekhV2Data.fromJson(Map<String, dynamic> json) {
    final articlesJson = json['articles'] as List<dynamic>? ?? [];
    final articlesList = articlesJson.map((e) => Article.fromJson(e)).toList();

    return AlekhV2Data(
      title: json['title'] ?? '',
      articles: articlesList,
      showAllText: json['show_all_text'] ?? '',
      backText: json['back_text'] ?? '',
    );
  }
}

class Article {
  final bool active;
  final String title;
  final String author;
  final int image;
  final String link;

  Article({
    required this.active,
    required this.title,
    required this.author,
    required this.image,
    required this.link,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      active: json['_active'] ?? false,
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      image: json['image'] ?? 0,
      link: json['link'] ?? '',
    );
  }
}
