import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';

import 'appearance_model.dart';
import 'biography_model.dart';
import 'powerstats_model.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required id,
    required name,
    required powerstats,
    required appearance,
    required biography,
    required work,
    required relatives,
    required images,
  }) : super(
          id: id,
          name: name,
          powerstats: powerstats,
          appearance: appearance,
          biography: biography,
          work: work,
          relatives: relatives,
          images: images,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      powerstats: PowerstatsModel.fromJson(json['powerstats']),
      appearance:
          AppearanceModel.fromJson(json['appearance'] as Map<String, dynamic>),
      biography:
          BiographyModel.fromJson(json['biography'] as Map<String, dynamic>),
      work: json['work']['occupation'] as String,
      relatives: json['connections']['relatives'] as String,
      images: json['images']['lg'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'powerstats': powerstats,
      'appearance': appearance,
      'biography': biography,
      'work': work,
      'relatives': relatives,
      'images': images,
    };
  }
}
