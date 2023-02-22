import 'package:pfa_application_1/service/models/openFda.dart';

class MedicineDescriptionApi {
  final List<Results>? results;
  const MedicineDescriptionApi({this.results});
  MedicineDescriptionApi copyWith({List<Results>? results}) {
    return MedicineDescriptionApi(results: results ?? this.results);
  }

  Map<String, Object?> toJson() {
    return {
      'results':
          results?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static MedicineDescriptionApi fromJson(Map<String, Object?> json) {
    return MedicineDescriptionApi(
        results: json['results'] == null
            ? null
            : (json['results'] as List)
                .map<Results>(
                    (data) => Results.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''MedicineDescriptionApi(
                results:${results.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is MedicineDescriptionApi &&
        other.runtimeType == runtimeType &&
        other.results == results;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, results);
  }
}

class Results {
  final List<String>? splProductDataElements;
  final List<String>? splUnclassifiedSection;
  final List<String>? boxedWarning;
  final List<String>? description;
  final List<String>? clinicalPharmacology;
  final List<String>? clinicalStudies;
  final List<String>? indicationsAndUsage;
  final List<String>? contraindications;
  final List<String>? warnings;
  final List<String>? precautions;
  final List<String>? generalPrecautions;
  final List<String>? informationForPatients;
  final List<String>? laboratoryTests;
  final List<String>? drugInteractions;
  final List<String>? carcinogenesisAndMutagenesisAndImpairmentOfFertility;
  final List<String>? useInSpecificPopulations;
  final List<String>? nursingMothers;
  final List<String>? geriatricUse;
  final List<String>? pediatricUse;
  final List<String>? adverseReactions;
  final List<String>? adverseReactionsTable;
  final List<String>? overdosage;
  final List<String>? dosageAndAdministration;
  final List<String>? howSupplied;
  final List<String>? howSuppliedTable;
  final List<String>? packageLabelPrincipalDisplayPanel;
  final String? setId;
  final String? id;
  final String? effectiveTime;
  final String? version;
  final Openfda? openfda;
  const Results(
      {this.splProductDataElements,
      this.splUnclassifiedSection,
      this.boxedWarning,
      this.description,
      this.clinicalPharmacology,
      this.clinicalStudies,
      this.indicationsAndUsage,
      this.contraindications,
      this.warnings,
      this.precautions,
      this.generalPrecautions,
      this.informationForPatients,
      this.laboratoryTests,
      this.drugInteractions,
      this.carcinogenesisAndMutagenesisAndImpairmentOfFertility,
      this.useInSpecificPopulations,
      this.nursingMothers,
      this.geriatricUse,
      this.pediatricUse,
      this.adverseReactions,
      this.adverseReactionsTable,
      this.overdosage,
      this.dosageAndAdministration,
      this.howSupplied,
      this.howSuppliedTable,
      this.packageLabelPrincipalDisplayPanel,
      this.setId,
      this.id,
      this.effectiveTime,
      this.version,
      this.openfda});
  Results copyWith(
      {List<String>? splProductDataElements,
      List<String>? splUnclassifiedSection,
      List<String>? boxedWarning,
      List<String>? description,
      List<String>? clinicalPharmacology,
      List<String>? clinicalStudies,
      List<String>? indicationsAndUsage,
      List<String>? contraindications,
      List<String>? warnings,
      List<String>? precautions,
      List<String>? generalPrecautions,
      List<String>? informationForPatients,
      List<String>? laboratoryTests,
      List<String>? drugInteractions,
      List<String>? carcinogenesisAndMutagenesisAndImpairmentOfFertility,
      List<String>? useInSpecificPopulations,
      List<String>? nursingMothers,
      List<String>? geriatricUse,
      List<String>? pediatricUse,
      List<String>? adverseReactions,
      List<String>? adverseReactionsTable,
      List<String>? overdosage,
      List<String>? dosageAndAdministration,
      List<String>? howSupplied,
      List<String>? howSuppliedTable,
      List<String>? packageLabelPrincipalDisplayPanel,
      String? setId,
      String? id,
      String? effectiveTime,
      String? version,
      Openfda? openfda}) {
    return Results(
        splProductDataElements:
            splProductDataElements ?? this.splProductDataElements,
        splUnclassifiedSection:
            splUnclassifiedSection ?? this.splUnclassifiedSection,
        boxedWarning: boxedWarning ?? this.boxedWarning,
        description: description ?? this.description,
        clinicalPharmacology: clinicalPharmacology ?? this.clinicalPharmacology,
        clinicalStudies: clinicalStudies ?? this.clinicalStudies,
        indicationsAndUsage: indicationsAndUsage ?? this.indicationsAndUsage,
        contraindications: contraindications ?? this.contraindications,
        warnings: warnings ?? this.warnings,
        precautions: precautions ?? this.precautions,
        generalPrecautions: generalPrecautions ?? this.generalPrecautions,
        informationForPatients:
            informationForPatients ?? this.informationForPatients,
        laboratoryTests: laboratoryTests ?? this.laboratoryTests,
        drugInteractions: drugInteractions ?? this.drugInteractions,
        carcinogenesisAndMutagenesisAndImpairmentOfFertility:
            carcinogenesisAndMutagenesisAndImpairmentOfFertility ??
                this.carcinogenesisAndMutagenesisAndImpairmentOfFertility,
        useInSpecificPopulations:
            useInSpecificPopulations ?? this.useInSpecificPopulations,
        nursingMothers: nursingMothers ?? this.nursingMothers,
        geriatricUse: geriatricUse ?? this.geriatricUse,
        pediatricUse: pediatricUse ?? this.pediatricUse,
        adverseReactions: adverseReactions ?? this.adverseReactions,
        adverseReactionsTable:
            adverseReactionsTable ?? this.adverseReactionsTable,
        overdosage: overdosage ?? this.overdosage,
        dosageAndAdministration:
            dosageAndAdministration ?? this.dosageAndAdministration,
        howSupplied: howSupplied ?? this.howSupplied,
        howSuppliedTable: howSuppliedTable ?? this.howSuppliedTable,
        packageLabelPrincipalDisplayPanel: packageLabelPrincipalDisplayPanel ??
            this.packageLabelPrincipalDisplayPanel,
        setId: setId ?? this.setId,
        id: id ?? this.id,
        effectiveTime: effectiveTime ?? this.effectiveTime,
        version: version ?? this.version,
        openfda: openfda ?? this.openfda);
  }

  Map<String, Object?> toJson() {
    return {
      'splProductDataElements': splProductDataElements,
      'splUnclassifiedSection': splUnclassifiedSection,
      'boxedWarning': boxedWarning,
      'description': description,
      'clinicalPharmacology': clinicalPharmacology,
      'clinicalStudies': clinicalStudies,
      'indicationsAndUsage': indicationsAndUsage,
      'contraindications': contraindications,
      'warnings': warnings,
      'precautions': precautions,
      'generalPrecautions': generalPrecautions,
      'informationForPatients': informationForPatients,
      'laboratoryTests': laboratoryTests,
      'drugInteractions': drugInteractions,
      'carcinogenesisAndMutagenesisAndImpairmentOfFertility':
          carcinogenesisAndMutagenesisAndImpairmentOfFertility,
      'useInSpecificPopulations': useInSpecificPopulations,
      'nursingMothers': nursingMothers,
      'geriatricUse': geriatricUse,
      'pediatricUse': pediatricUse,
      'adverseReactions': adverseReactions,
      'adverseReactionsTable': adverseReactionsTable,
      'overdosage': overdosage,
      'dosageAndAdministration': dosageAndAdministration,
      'howSupplied': howSupplied,
      'howSuppliedTable': howSuppliedTable,
      'packageLabelPrincipalDisplayPanel': packageLabelPrincipalDisplayPanel,
      'setId': setId,
      'id': id,
      'effectiveTime': effectiveTime,
      'version': version,
      'openfda': openfda?.toJson()
    };
  }

  static Results fromJson(Map<String, Object?> json) {
    return Results(
        splProductDataElements: json['splProductDataElements'] == null
            ? null
            : json['splProductDataElements'] as List<String>,
        splUnclassifiedSection: json['splUnclassifiedSection'] == null
            ? null
            : json['splUnclassifiedSection'] as List<String>,
        boxedWarning: json['boxedWarning'] == null
            ? null
            : json['boxedWarning'] as List<String>,
        description: json['description'] == null
            ? null
            : json['description'] as List<String>,
        clinicalPharmacology: json['clinicalPharmacology'] == null
            ? null
            : json['clinicalPharmacology'] as List<String>,
        clinicalStudies: json['clinicalStudies'] == null
            ? null
            : json['clinicalStudies'] as List<String>,
        indicationsAndUsage: json['indicationsAndUsage'] == null
            ? null
            : json['indicationsAndUsage'] as List<String>,
        contraindications: json['contraindications'] == null
            ? null
            : json['contraindications'] as List<String>,
        warnings:
            json['warnings'] == null ? null : json['warnings'] as List<String>,
        precautions: json['precautions'] == null
            ? null
            : json['precautions'] as List<String>,
        generalPrecautions: json['generalPrecautions'] == null
            ? null
            : json['generalPrecautions'] as List<String>,
        informationForPatients: json['informationForPatients'] == null
            ? null
            : json['informationForPatients'] as List<String>,
        laboratoryTests: json['laboratoryTests'] == null
            ? null
            : json['laboratoryTests'] as List<String>,
        drugInteractions: json['drugInteractions'] == null
            ? null
            : json['drugInteractions'] as List<String>,
        carcinogenesisAndMutagenesisAndImpairmentOfFertility:
            json['carcinogenesisAndMutagenesisAndImpairmentOfFertility'] == null
                ? null
                : json['carcinogenesisAndMutagenesisAndImpairmentOfFertility']
                    as List<String>,
        useInSpecificPopulations: json['useInSpecificPopulations'] == null
            ? null
            : json['useInSpecificPopulations'] as List<String>,
        nursingMothers: json['nursingMothers'] == null
            ? null
            : json['nursingMothers'] as List<String>,
        geriatricUse: json['geriatricUse'] == null
            ? null
            : json['geriatricUse'] as List<String>,
        pediatricUse: json['pediatricUse'] == null
            ? null
            : json['pediatricUse'] as List<String>,
        adverseReactions: json['adverseReactions'] == null
            ? null
            : json['adverseReactions'] as List<String>,
        adverseReactionsTable: json['adverseReactionsTable'] == null
            ? null
            : json['adverseReactionsTable'] as List<String>,
        overdosage: json['overdosage'] == null
            ? null
            : json['overdosage'] as List<String>,
        dosageAndAdministration: json['dosageAndAdministration'] == null
            ? null
            : json['dosageAndAdministration'] as List<String>,
        howSupplied: json['howSupplied'] == null
            ? null
            : json['howSupplied'] as List<String>,
        howSuppliedTable: json['howSuppliedTable'] == null
            ? null
            : json['howSuppliedTable'] as List<String>,
        packageLabelPrincipalDisplayPanel: json['packageLabelPrincipalDisplayPanel'] == null
            ? null
            : json['packageLabelPrincipalDisplayPanel'] as List<String>,
        setId: json['setId'] == null ? null : json['setId'] as String,
        id: json['id'] == null ? null : json['id'] as String,
        effectiveTime: json['effectiveTime'] == null ? null : json['effectiveTime'] as String,
        version: json['version'] == null ? null : json['version'] as String,
        openfda: json['openfda'] == null ? null : Openfda.fromJson(json['openfda'] as Map<String, Object?>));
  }

  @override
  bool operator ==(Object other) {
    return other is Results &&
        other.runtimeType == runtimeType &&
        other.splProductDataElements == splProductDataElements &&
        other.splUnclassifiedSection == splUnclassifiedSection &&
        other.boxedWarning == boxedWarning &&
        other.description == description &&
        other.clinicalPharmacology == clinicalPharmacology &&
        other.clinicalStudies == clinicalStudies &&
        other.indicationsAndUsage == indicationsAndUsage &&
        other.contraindications == contraindications &&
        other.warnings == warnings &&
        other.precautions == precautions &&
        other.generalPrecautions == generalPrecautions &&
        other.informationForPatients == informationForPatients &&
        other.laboratoryTests == laboratoryTests &&
        other.drugInteractions == drugInteractions &&
        other.carcinogenesisAndMutagenesisAndImpairmentOfFertility ==
            carcinogenesisAndMutagenesisAndImpairmentOfFertility &&
        other.useInSpecificPopulations == useInSpecificPopulations &&
        other.nursingMothers == nursingMothers &&
        other.geriatricUse == geriatricUse &&
        other.pediatricUse == pediatricUse &&
        other.adverseReactions == adverseReactions &&
        other.adverseReactionsTable == adverseReactionsTable &&
        other.overdosage == overdosage &&
        other.dosageAndAdministration == dosageAndAdministration &&
        other.howSupplied == howSupplied &&
        other.howSuppliedTable == howSuppliedTable &&
        other.packageLabelPrincipalDisplayPanel ==
            packageLabelPrincipalDisplayPanel &&
        other.setId == setId &&
        other.id == id &&
        other.effectiveTime == effectiveTime &&
        other.version == version &&
        other.openfda == openfda;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        splProductDataElements,
        splUnclassifiedSection,
        boxedWarning,
        description,
        clinicalPharmacology,
        clinicalStudies,
        indicationsAndUsage,
        contraindications,
        warnings,
        precautions,
        generalPrecautions,
        informationForPatients,
        laboratoryTests,
        drugInteractions,
        carcinogenesisAndMutagenesisAndImpairmentOfFertility,
        useInSpecificPopulations,
        nursingMothers,
        geriatricUse,
        pediatricUse);
  }
}
