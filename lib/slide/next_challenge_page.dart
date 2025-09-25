import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class NextChallengePage extends StatelessWidget {
  const NextChallengePage({super.key});

  static FlutterDeckSlideWidget get slide =>
      NextChallengePage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/next-challenge'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '🔥 Next challenges of animated_to',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            Gap(60),
            _Item(
              title: 'Sliver',
              description: 'Sliver works based completely on different rules.',
            ),
            Gap(32),
            _Item(
              title: 'Nested',
              description: 'Once AnimatedTo nests, conflicts each other...',
            ),
            Gap(32),
            _Item(
              title: 'Hit Test',
              description: 'Widgets look animating, but gestures don\'t.',
            ),
            Gap(32),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: FlutterDeckTheme.of(context).textTheme.subtitle),
        Gap(8),
        Text(
          description,
          style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
