import 'package:flutter/material.dart';
import 'package:flutter_rest_api/common/app_colors.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:flutter_rest_api/feature/presentation/pages/person_detail_screen.dart';
import 'package:flutter_rest_api/feature/presentation/widgets/peson_cache_widget.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  Widget _powerStats(String namePower, int value) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 8,
        ),
        Text(
          namePower,
          style: const TextStyle(
            color: Colors.white,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        //Expanded(
        //child:
        Container(
          height: 8,
          width: double.parse('$value'),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        //),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailPage(person: person),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: PersonCasheImage(
                height: 166,
                width: 166,
                imageUrl: person.images,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _powerStats('intelligence:', person.powerstats.intelligence),
                  _powerStats('strength:', person.powerstats.strength),
                  _powerStats('speed:', person.powerstats.speed),
                  _powerStats('durability:', person.powerstats.durability),
                  _powerStats('power:', person.powerstats.power),
                  _powerStats('combat:', person.powerstats.combat),
                  // Row(
                  //   children: <Widget>[
                  //     //intelligence;
                  //     //strength;
                  //     //speed;
                  //     //durability;
                  //     //power;
                  //     //combat;

                  //     const SizedBox(
                  //       width: 8,
                  //     ),
                  //     const Text(
                  //       'intelligence:',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //       ),
                  //       maxLines: 1,
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //     const SizedBox(
                  //       width: 8,
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         '${person.powerstats.intelligence}',
                  //         style: const TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //         maxLines: 1,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 8,
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         height: 8,
                  //         width: double.parse(
                  //                 '${person.powerstats.intelligence}') /
                  //             100,
                  //         decoration: BoxDecoration(
                  //           color: Colors.green,
                  //           borderRadius: BorderRadius.circular(4),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Gender:',
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    person.appearance.gender,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Eye Color:',
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    person.appearance.eyeColor,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
