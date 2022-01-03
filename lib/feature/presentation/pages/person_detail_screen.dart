import 'package:flutter/material.dart';
import 'package:flutter_rest_api/common/app_colors.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            PersonCasheImage(
                height: 260, width: 260, imageUrl: person.images //image,
                ),

            const SizedBox(
              height: 12,
            ),

            Text(
              person.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(
              height: 16,
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
            // if (person.type.isNotEmpty)
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(color: AppColors.greyColor),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}