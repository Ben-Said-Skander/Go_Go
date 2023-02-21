// ignore_for_file: empty_constructor_bodies

class Medicine {
  // final List<dynamic>? notificationID;
  final String? name;
  final String? dosage;
  final String? type;
  final int? interval;
  final String? start_time;
//Constructeur
  Medicine({
    this.name,
    this.dosage,
    this.type,
    this.interval,
    this.start_time,
    // this.notificationID
  });

  // Transform attributs to JSON Map format (we send data with JSON format)

  Map<String, dynamic> toJson() {
    return {
      //   "ids": notificationID,
      "name": name,
      "dosage": dosage,
      "type": type,
      "interval": interval,
      "start_time": start_time
    };
  }

  // Transform JSON Map to normal Model
  factory Medicine.fromJson(Map<String, dynamic> parsedJson) {
    return Medicine(
      // notificationID: parsedJson["ids"],
      name: parsedJson["name"],
      dosage: parsedJson["dosage"],
      type: parsedJson["type"],
      interval: parsedJson["interval"],
      start_time: parsedJson["start_time"],
    );
  }
}
