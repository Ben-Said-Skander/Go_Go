class User {
  final String? id;
  final String? fullname;
  final int? phoneNumber;
  final String? email;
  final String? password;

  //Constructeur
  User({this.fullname, this.email, this.password, this.phoneNumber, this.id});

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
    };
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        fullname: parsedJson["fullname"],
        email: parsedJson["email"],
        password: parsedJson["password"],
        phoneNumber: parsedJson["phoneNumber"],
        id: parsedJson['_id']['\$oid']);
  }
}
