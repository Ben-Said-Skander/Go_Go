class User {
  final String? id;
  final String? fullname;
  final int? phoneNumber;
  final String? email;
  final String? password;

  final String? isAvailable;
  final String? carModel;
  final String? destination;

  //Constructeur
  User(
      {this.fullname,
      this.email,
      this.password,
      this.phoneNumber,
      this.isAvailable,
      this.carModel,
      this.destination,
      this.id});

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "isAvailable": isAvailable,
      "carModel": carModel,
      "destination": destination,
    };
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        fullname: parsedJson["fullname"],
        email: parsedJson["email"],
        password: parsedJson["password"],
        phoneNumber: parsedJson["phoneNumber"],
        isAvailable: parsedJson["isAvailable"],
        carModel: parsedJson["carModel"],
        destination: parsedJson["destination"],
        id: parsedJson['_id']);
  }
}
