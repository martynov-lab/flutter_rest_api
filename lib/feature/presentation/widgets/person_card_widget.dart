import 'package:flutter/material.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:flutter_rest_api/feature/presentation/pages/person_detail_screen.dart';
import 'package:flutter_rest_api/feature/presentation/widgets/peson_cache_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  Widget _powerStats(String namePower, int value, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                namePower,
                style: const TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '$value',
                style: const TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * 0.15,
          lineHeight: 8.0,
          percent: double.parse('$value') * 0.01,
          backgroundColor: Colors.grey[400],
          progressColor: Colors.lightGreen[600],
          isRTL: true,
        ),
      ],
    );
  }

  Widget _specifications(String property, String value) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            property,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
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
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: <Widget>[
            PersonCasheImage(
              height: 250,
              width: 166,
              imageUrl: person.images,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          person.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.star_border,
                            color: Colors.grey[600],
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    _powerStats('intelligence:', person.powerstats.intelligence,
                        context),
                    _powerStats(
                        'strength:', person.powerstats.strength, context),
                    _powerStats('speed:', person.powerstats.speed, context),
                    _powerStats(
                        'durability:', person.powerstats.durability, context),
                    _powerStats('power:', person.powerstats.power, context),
                    _powerStats('combat:', person.powerstats.combat, context),
                    const SizedBox(
                      height: 8,
                    ),
                    _specifications('Race:', person.appearance.race!),
                    _specifications('Gender:', person.appearance.gender),
                    _specifications('Hair Color:', person.appearance.hairColor),
                    _specifications('Eye Color:', person.appearance.eyeColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
