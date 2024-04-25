class Post {

  final String? id;
  final String? userId;
  final String? fullname;
  final String? destination;
  final String? carModel;

//Constructeur
  Post({
    this.id,
    this.userId,
    this.fullname,
    this.destination,
    this.carModel,
  });
//geters
  String get getfullname => fullname!;
  String get getdestination => destination!;
  String get getcarModel => carModel!;

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "fullname": fullname,
      "destination": destination,
      "carModel": carModel,
    };
  }

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
        fullname: parsedJson["fullname"],
        destination: parsedJson["destination"],
        carModel: parsedJson["carModel"],
        id: parsedJson['_id'],
        userId: parsedJson["userId"]
    );
  }
}
