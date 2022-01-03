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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 110,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                namePower,
                style: const TextStyle(
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '$value',
                style: const TextStyle(
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Container(
          height: 8,
          width: double.parse('$value') / 2,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
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
                height: 250,
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
                  Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _powerStats('intelligence:', person.powerstats.intelligence),
                  _powerStats('strength:', person.powerstats.strength),
                  _powerStats('speed:', person.powerstats.speed),
                  _powerStats('durability:', person.powerstats.durability),
                  _powerStats('power:', person.powerstats.power),
                  _powerStats('combat:', person.powerstats.combat),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Race:',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        person.appearance.race!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gender:',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        person.appearance.gender,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hair Color:',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        person.appearance.hairColor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Eye Color:',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        person.appearance.eyeColor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),

                  // const Text(
                  //   'Gender:',
                  //   style: TextStyle(
                  //     color: AppColors.greyColor,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 4,
                  // ),
                  // Text(
                  //   person.appearance.gender,
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //   ),
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  // const Text(
                  //   'Eye Color:',
                  //   style: TextStyle(
                  //     color: AppColors.greyColor,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 4,
                  // ),
                  // Text(
                  //   person.appearance.eyeColor,
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //   ),
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
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
