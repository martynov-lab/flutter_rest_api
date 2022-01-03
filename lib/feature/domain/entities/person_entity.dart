import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int id;
  final String name;
  final PowerstatsEntity powerstats;
  final AppearanceEntity appearance;
  final BiographyEntity biography;
  final String work;
  final String relatives;
  final String images;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.powerstats,
    required this.appearance,
    required this.biography,
    required this.work,
    required this.relatives,
    required this.images,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        powerstats,
        appearance,
        biography,
        work,
        relatives,
        images,
      ];
}

class PowerstatsEntity {
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;
  PowerstatsEntity({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });
}

class AppearanceEntity {
  final String gender;
  final String? race;
  //final String height;
  //final String weight;
  final String eyeColor;
  final String hairColor;
  AppearanceEntity({
    required this.gender,
    required this.race,
    //required this.height,
    //required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });
}

class BiographyEntity {
  final String fullName;
  //final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  BiographyEntity({
    required this.fullName,
    //required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
  });
}
