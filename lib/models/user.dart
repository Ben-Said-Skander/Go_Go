class User {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? password;

//Constructeur
  User({
    this.firstname,
    this.lastname,
    this.email,
    this.password,
  });
//geters
  String get getUserTitle => firstname!;
  String get getCategory => lastname!;
  String get getUserBody => email!;
  String get getPicture => password!;

  // Transform attributs to Json Format

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "password": password,
    };
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      firstname: parsedJson["firstname"],
      lastname: parsedJson["lastname"],
      email: parsedJson["email"],
      password: parsedJson["password"],
    );
  }
}
