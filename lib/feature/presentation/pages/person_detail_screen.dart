import 'package:flutter/material.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:flutter_rest_api/feature/presentation/widgets/peson_cache_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({Key? key, required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                person.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(10.0)),
              child: PersonCasheImage(
                height: 350,
                width: double.infinity,
                imageUrl: person.images,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...buildText('Relatives:', person.relatives),
                  //...buildText('Gender:', person.appearance.gender),
                  ...buildText('Work:', person.work),
                  ...buildText('Full Name:', person.biography.fullName),
                  ...buildText(
                      'First Appearance:', person.biography.firstAppearance),
                  ...buildText(
                      'Place Of Birth:', person.biography.placeOfBirth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}
