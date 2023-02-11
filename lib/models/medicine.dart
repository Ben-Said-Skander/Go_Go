// ignore_for_file: empty_constructor_bodies

class Medicine {
  final List<dynamic>? notificationID;
  final String? medicineName;
  final String? dosage;
  final String? medicineType;
  final int? interval;
  final String? startingTime;
//Constructeur
  Medicine(
      {this.medicineName,
      this.dosage,
      this.medicineType,
      this.interval,
      this.startingTime,
      this.notificationID});
//geters
  String get getName => medicineName!;
  String get getDosage => dosage!;
  List get getNotificationID => notificationID!;
  String get getMedicineType => medicineType!;
  int get getInterval => interval!;
  String get getStartingTime => startingTime!;

  // Transform attributs to JSON Map format (we send data with JSON format)

  Map<String, dynamic> toJson() {
    return {
      "ids": notificationID,
      "medicineName": medicineName,
      "dosage": dosage,
      "medicineType": medicineType,
      "interval": interval,
      "startingTime": startingTime
    };
  }

  // Transform JSON Map to normal Model
  factory Medicine.fromJson(Map<String, dynamic> parsedJson) {
    return Medicine(
      notificationID: parsedJson["ids"],
      medicineName: parsedJson["name"],
      dosage: parsedJson["dosage"],
      medicineType: parsedJson["type"],
      interval: parsedJson["interval"],
      startingTime: parsedJson["start"],
    );
  }
}
