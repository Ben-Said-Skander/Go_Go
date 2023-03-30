import 'dart:typed_data';

class Picture {
  final String? id;
  final Uint8List? data;
  final String? contentType;

//Constructeur
  Picture({
    this.id,
    this.data,
    this.contentType,
  });

  // Transform attributs to JSON Map format (we send data with JSON format)

  Map<String, dynamic> toJson() {
    return {
      "data": data,
      "contentType": contentType,
    };
  }

  // Transform JSON Map to normal Model
  factory Picture.fromJson(Map<String, dynamic> parsedJson) {
    return Picture(
      data: parsedJson["data"],
      contentType: parsedJson["contentType"],
      id: parsedJson['_id'],
    );
  }
}
