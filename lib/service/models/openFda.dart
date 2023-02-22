class Openfda {
  final List<String>? applicationNumber;
  final List<String>? brandName;
  final List<String>? genericName;
  final List<String>? manufacturerName;
  final List<String>? productNdc;
  final List<String>? productType;
  final List<String>? route;
  final List<String>? substanceName;
  final List<String>? rxcui;
  final List<String>? splId;
  final List<String>? splSetId;
  final List<String>? packageNdc;
  final List<bool>? isOriginalPackager;
  final List<String>? nui;
  final List<String>? pharmClassPe;
  final List<String>? pharmClassEpc;
  final List<String>? pharmClassCs;
  final List<String>? unii;
  const Openfda(
      {this.applicationNumber,
      this.brandName,
      this.genericName,
      this.manufacturerName,
      this.productNdc,
      this.productType,
      this.route,
      this.substanceName,
      this.rxcui,
      this.splId,
      this.splSetId,
      this.packageNdc,
      this.isOriginalPackager,
      this.nui,
      this.pharmClassPe,
      this.pharmClassEpc,
      this.pharmClassCs,
      this.unii});
  Openfda copyWith(
      {List<String>? applicationNumber,
      List<String>? brandName,
      List<String>? genericName,
      List<String>? manufacturerName,
      List<String>? productNdc,
      List<String>? productType,
      List<String>? route,
      List<String>? substanceName,
      List<String>? rxcui,
      List<String>? splId,
      List<String>? splSetId,
      List<String>? packageNdc,
      List<bool>? isOriginalPackager,
      List<String>? nui,
      List<String>? pharmClassPe,
      List<String>? pharmClassEpc,
      List<String>? pharmClassCs,
      List<String>? unii}) {
    return Openfda(
        applicationNumber: applicationNumber ?? this.applicationNumber,
        brandName: brandName ?? this.brandName,
        genericName: genericName ?? this.genericName,
        manufacturerName: manufacturerName ?? this.manufacturerName,
        productNdc: productNdc ?? this.productNdc,
        productType: productType ?? this.productType,
        route: route ?? this.route,
        substanceName: substanceName ?? this.substanceName,
        rxcui: rxcui ?? this.rxcui,
        splId: splId ?? this.splId,
        splSetId: splSetId ?? this.splSetId,
        packageNdc: packageNdc ?? this.packageNdc,
        isOriginalPackager: isOriginalPackager ?? this.isOriginalPackager,
        nui: nui ?? this.nui,
        pharmClassPe: pharmClassPe ?? this.pharmClassPe,
        pharmClassEpc: pharmClassEpc ?? this.pharmClassEpc,
        pharmClassCs: pharmClassCs ?? this.pharmClassCs,
        unii: unii ?? this.unii);
  }

  Map<String, Object?> toJson() {
    return {
      'applicationNumber': applicationNumber,
      'brandName': brandName,
      'genericName': genericName,
      'manufacturerName': manufacturerName,
      'productNdc': productNdc,
      'productType': productType,
      'route': route,
      'substanceName': substanceName,
      'rxcui': rxcui,
      'splId': splId,
      'splSetId': splSetId,
      'packageNdc': packageNdc,
      'isOriginalPackager': isOriginalPackager,
      'nui': nui,
      'pharmClassPe': pharmClassPe,
      'pharmClassEpc': pharmClassEpc,
      'pharmClassCs': pharmClassCs,
      'unii': unii
    };
  }

  static Openfda fromJson(Map<String, Object?> json) {
    return Openfda(
        applicationNumber: json['applicationNumber'] == null
            ? null
            : json['applicationNumber'] as List<String>,
        brandName: json['brandName'] == null
            ? null
            : json['brandName'] as List<String>,
        genericName: json['genericName'] == null
            ? null
            : json['genericName'] as List<String>,
        manufacturerName: json['manufacturerName'] == null
            ? null
            : json['manufacturerName'] as List<String>,
        productNdc: json['productNdc'] == null
            ? null
            : json['productNdc'] as List<String>,
        productType: json['productType'] == null
            ? null
            : json['productType'] as List<String>,
        route: json['route'] == null ? null : json['route'] as List<String>,
        substanceName: json['substanceName'] == null
            ? null
            : json['substanceName'] as List<String>,
        rxcui: json['rxcui'] == null ? null : json['rxcui'] as List<String>,
        splId: json['splId'] == null ? null : json['splId'] as List<String>,
        splSetId:
            json['splSetId'] == null ? null : json['splSetId'] as List<String>,
        packageNdc: json['packageNdc'] == null
            ? null
            : json['packageNdc'] as List<String>,
        isOriginalPackager: json['isOriginalPackager'] == null
            ? null
            : json['isOriginalPackager'] as List<bool>,
        nui: json['nui'] == null ? null : json['nui'] as List<String>,
        pharmClassPe: json['pharmClassPe'] == null
            ? null
            : json['pharmClassPe'] as List<String>,
        pharmClassEpc: json['pharmClassEpc'] == null
            ? null
            : json['pharmClassEpc'] as List<String>,
        pharmClassCs: json['pharmClassCs'] == null
            ? null
            : json['pharmClassCs'] as List<String>,
        unii: json['unii'] == null ? null : json['unii'] as List<String>);
  }

  @override
  String toString() {
    return '''Openfda(
                applicationNumber:$applicationNumber,
brandName:$brandName,
genericName:$genericName,
manufacturerName:$manufacturerName,
productNdc:$productNdc,
productType:$productType,
route:$route,
substanceName:$substanceName,
rxcui:$rxcui,
splId:$splId,
splSetId:$splSetId,
packageNdc:$packageNdc,
isOriginalPackager:$isOriginalPackager,
nui:$nui,
pharmClassPe:$pharmClassPe,
pharmClassEpc:$pharmClassEpc,
pharmClassCs:$pharmClassCs,
unii:$unii
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Openfda &&
        other.runtimeType == runtimeType &&
        other.applicationNumber == applicationNumber &&
        other.brandName == brandName &&
        other.genericName == genericName &&
        other.manufacturerName == manufacturerName &&
        other.productNdc == productNdc &&
        other.productType == productType &&
        other.route == route &&
        other.substanceName == substanceName &&
        other.rxcui == rxcui &&
        other.splId == splId &&
        other.splSetId == splSetId &&
        other.packageNdc == packageNdc &&
        other.isOriginalPackager == isOriginalPackager &&
        other.nui == nui &&
        other.pharmClassPe == pharmClassPe &&
        other.pharmClassEpc == pharmClassEpc &&
        other.pharmClassCs == pharmClassCs &&
        other.unii == unii;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        applicationNumber,
        brandName,
        genericName,
        manufacturerName,
        productNdc,
        productType,
        route,
        substanceName,
        rxcui,
        splId,
        splSetId,
        packageNdc,
        isOriginalPackager,
        nui,
        pharmClassPe,
        pharmClassEpc,
        pharmClassCs,
        unii);
  }
}
