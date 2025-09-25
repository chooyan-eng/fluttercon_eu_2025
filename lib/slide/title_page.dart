import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  static FlutterDeckSlideWidget get slide => TitlePage().withSlideConfiguration(
    FlutterDeckSlideConfiguration(route: '/title'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'AnimatedTo: A Game Changer for Your Moving Animations',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            Gap(60),
            CircleAvatar(
              backgroundImage: AssetImage('assets/me_photo.jpg'),
              radius: 60,
            ),
            Gap(16),
            Text(
              'Tsuyoshi Chujo',
              style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
            ),
            Gap(8),
            Text(
              'Freelance Flutter Developer',
              style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
