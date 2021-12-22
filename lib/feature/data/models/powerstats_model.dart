import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';

class PowerstatsModel extends PowerstatsEntity {
  PowerstatsModel({
    intelligence,
    strength,
    speed,
    durability,
    power,
    combat,
  }) : super(
          intelligence: intelligence,
          strength: strength,
          speed: speed,
          durability: durability,
          power: power,
          combat: combat,
        );

  factory PowerstatsModel.fromJson(Map<String, dynamic> json) {
    return PowerstatsModel(
      intelligence: json['intelligence'] as int,
      strength: json['strength'] as int,
      speed: json['speed'] as int,
      durability: json['durability'] as int,
      power: json['power'] as int,
      combat: json['combat'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
    };
  }
}
