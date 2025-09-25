import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WhyGameChangerPage extends StatelessWidget {
  const WhyGameChangerPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      WhyGameChangerPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/why-game-changer'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Why Game Changer?',
          style: FlutterDeckTheme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
