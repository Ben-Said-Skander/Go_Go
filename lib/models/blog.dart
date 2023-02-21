class Blog {
  final String? title;
  final String? category;
  final String? body;
  //final String? pictureUrl;

//Constructeur
  Blog({
    this.title,
    this.category,
    this.body,
  //  this.pictureUrl,
  });
//geters
  String get getTitle => title!;
  String get getCategory => category!;
  String get getBody => body!;
 // String get getPicture => pictureUrl!;

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "body": body,
   //   "pictureUrl": pictureUrl,
    };
  }

  factory Blog.fromJson(Map<String, dynamic> parsedJson) {
    return Blog(
      title: parsedJson["title"],
      category: parsedJson["category"],
      body: parsedJson["body"],
  //    pictureUrl: parsedJson["pictureUrl"],
    );
  }
}
