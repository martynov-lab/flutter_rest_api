import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';

class AppearanceModel extends AppearanceEntity {
  AppearanceModel({
    gender,
    race,
    //height,
    //weight,
    eyeColor,
    hairColor,
  }) : super(
          gender: gender,
          race: race,
          //height:height,
          //weight:weight,
          eyeColor: eyeColor,
          hairColor: hairColor,
        );

  factory AppearanceModel.fromJson(Map<String, dynamic> json) {
    return AppearanceModel(
      gender: json['gender'] as String,
      race: json['race'] ?? '-',
      //height: json['height'] as String,
      //weight: json['weight'] as String,
      eyeColor: json['eyeColor'] as String,
      hairColor: json['hairColor'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'race': race,
      //'height':height,
      //'weight':weight,
      'eyeColor': eyeColor,
      'hairColor': hairColor,
    };
  }
}
