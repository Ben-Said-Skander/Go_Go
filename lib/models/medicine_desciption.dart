class MedicineDescription {
  final String? adverse_reactions;
  final String? dosage_and_administration;
  final String? indications_and_usage;
  final String? description;
  final String? generic_name;

  MedicineDescription(
      {this.adverse_reactions,
      this.dosage_and_administration,
      this.indications_and_usage,
      this.description,
      this.generic_name});

  factory MedicineDescription.fromJson(Map<String, dynamic> parsedJson) {
    return MedicineDescription(
      // notificationID: parsedJson["ids"],
      adverse_reactions: parsedJson["adverse_reactions"],
      dosage_and_administration: parsedJson["dosage_and_administration"],
      indications_and_usage: parsedJson["indications_and_usage"],
      description: parsedJson["description"],
      generic_name: parsedJson["generic_name"],
    );
  }
}
