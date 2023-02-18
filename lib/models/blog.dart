class Blog {
  final String? title;
  final String? category;
  final String? body;
  final String? picture;

//Constructeur
  Blog({
    this.title,
    this.category,
    this.body,
    this.picture,
  });
//geters
  String get getTitle => title!;
  String get getCategory => category!;
  String get getBody => body!;
  String get getPicture => picture!;

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "body": body,
      "picture": picture,
    };
  }

  factory Blog.fromJson(Map<String, dynamic> parsedJson) {
    return Blog(
      title: parsedJson["title"],
      category: parsedJson["category"],
      body: parsedJson["body"],
      picture: parsedJson["picture"],
    );
  }
}
