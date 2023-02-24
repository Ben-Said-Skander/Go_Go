// ignore_for_file: empty_constructor_bodies

class Medicine {
  final String? name;
  //  final Int? dosage;
  final String? dosage;
  // final Int? type;
  final String? type;
  final String? interval;
  final String? start_time;
//Constructeur
  Medicine({
    this.name,
    this.dosage,
    this.type,
    this.interval,
    this.start_time,
  });

  // Transform attributs to JSON Map format (we send data with JSON format)

  Map<String, dynamic> toJson() {
    return {
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
      name: parsedJson["name"],
      dosage: parsedJson["dosage"],
      //dosage: parsedJson["dosage"].toString(),
      //type: parsedJson["type"].toString(),
      type: parsedJson["type"],
      interval: parsedJson["interval"],
      start_time: parsedJson["start_time"],
    );
  }
}
