class Blog {
  final String? blogTitle;
  final String? category;
  final String? blogBody;
  final String? picture;

//Constructeur
  Blog({
    this.blogTitle,
    this.category,
    this.blogBody,
    this.picture,
  });
//geters
  String get getBlogTitle => blogTitle!;
  String get getCategory => category!;
  String get getBlogBody => blogBody!;
  String get getPicture => picture!;

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "blogTitle": blogTitle,
      "category": category,
      "blogBody": blogBody,
      "picture": picture,
    };
  }

  factory Blog.fromJson(Map<String, dynamic> parsedJson) {
    return Blog(
      blogTitle: parsedJson["title"],
      category: parsedJson["category"],
      blogBody: parsedJson["body"],
      picture: parsedJson["picture"],
    );
  }
}
