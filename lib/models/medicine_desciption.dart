// ignore_for_file: empty_constructor_bodies

class MedicineDescription {
  final List<String>? adverse_reactions;
  final List<String>? dosage_and_administration;
  final List<String>? indications_and_usage;
  final List<String>? generic_name;
  final List<String>? description;

  MedicineDescription(
    this.adverse_reactions,
    this.dosage_and_administration,
    this.indications_and_usage,
    this.generic_name,
    this.description,
  );
}
