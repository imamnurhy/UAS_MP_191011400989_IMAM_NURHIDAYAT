class ArticleModel {
  ArticleModel({
    required this.id,
    required this.title,
    required this.resume,
    required this.description,
    required this.subtitle,
    required this.createdAt,
    required this.views,
    required this.publish,
    required this.headline,
    required this.likes,
    required this.menu,
    required this.submenu,
    required this.category,
    required this.subcategory,
    required this.source,
    required this.province,
    required this.image,
    required this.editor,
  });

  final int id;
  final String title;
  final String resume;
  final String description;
  final dynamic subtitle;
  final String createdAt;
  final int views;
  final int publish;
  final dynamic headline;
  final int likes;
  final String menu;
  final String submenu;
  final String category;
  final String subcategory;
  final String source;
  final String province;
  final String image;
  final String editor;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        title: json["title"],
        resume: json["resume"],
        description: json["description"],
        subtitle: json["subtitle"],
        createdAt: json["created_at"],
        views: json["views"],
        publish: json["publish"],
        headline: json["headline"],
        likes: json["likes"],
        menu: json["menu"],
        submenu: json["submenu"],
        category: json["category"],
        subcategory: json["subcategory"],
        source: json["source"],
        province: json["province"],
        image: json["image"],
        editor: json["editor"],
      );
}
