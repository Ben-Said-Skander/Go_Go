class Pharmacy {
  // final List<dynamic>? notificationID;
  final String? name;
  final double? latitude;
  final double? longitude;
  final Map<String, dynamic>? drugs;
  Pharmacy({this.name, this.latitude, this.longitude, this.drugs});

  // Transform JSON Map to normal Model
  factory Pharmacy.fromJson(Map<String, dynamic> parsedJson) {
    return Pharmacy(
        name: parsedJson["name"],
        latitude: parsedJson["latitude"],
        longitude: parsedJson["longitude"],
        drugs: parsedJson["drugs"]);
  }
}
