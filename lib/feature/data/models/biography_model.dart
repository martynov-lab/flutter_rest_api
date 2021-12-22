import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';

class BiographyModel extends BiographyEntity {
  BiographyModel({
    fullName,
    //aliases,
    placeOfBirth,
    firstAppearance,
  }) : super(
          fullName: fullName,
          //aliases:aliases,
          placeOfBirth: placeOfBirth,
          firstAppearance: firstAppearance,
        );

  factory BiographyModel.fromJson(Map<String, dynamic> json) {
    return BiographyModel(
      fullName: json['fullName'] as String,
      //aliases: json['aliases'] as List<String>,
      placeOfBirth: json['placeOfBirth'] as String,
      firstAppearance: json['firstAppearance'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      //'aliases':aliases,
      'placeOfBirth': placeOfBirth,
      'firstAppearance': firstAppearance,
    };
  }
}
