class Blog {
  final String? id;
  final String? userId;
  final String? imageId;
  final String? title;
  final String? category;
  final String? body;

//Constructeur
  Blog({
    this.id,
    this.userId,
    this.imageId,
    this.title,
    this.category,
    this.body,
  });
//geters
  String get getTitle => title!;
  String get getCategory => category!;
  String get getBody => body!;

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "category": category,
      "body": body,
    };
  }

  factory Blog.fromJson(Map<String, dynamic> parsedJson) {
    return Blog(
        title: parsedJson["title"],
        category: parsedJson["category"],
        body: parsedJson["body"],
        id: parsedJson['_id'],
        userId: parsedJson["userId"],
        imageId: parsedJson['imageId']);
  }
}
