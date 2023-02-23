class Pharmacy {
  // final List<dynamic>? notificationID;
  final String? name;
  final int? latitude;
  final int? longitude;

  Pharmacy({
    this.name,
    this.latitude,
    this.longitude,
  });

  // Transform JSON Map to normal Model
  factory Pharmacy.fromJson(Map<String, dynamic> parsedJson) {
    return Pharmacy(
      name: parsedJson["name"],
      latitude: parsedJson["latitude"],
      longitude: parsedJson["longitude"],
    );
  }
}
