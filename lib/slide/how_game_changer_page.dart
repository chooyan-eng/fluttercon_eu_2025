import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class HowGameChangerPage extends StatelessWidget {
  const HowGameChangerPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      HowGameChangerPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/how-game-changer'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'animated_to is...',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            Gap(60),
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('handy'),
              slidingFrom: Offset(0, 200),
              child: _Item(
                title: 'Handy',
                description: 'Wrap, rebuild, then animate!',
              ),
            ),
            Gap(32),
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('smooth'),
              slidingFrom: Offset(0, 400),
              child: _Item(
                title: 'Smooth',
                description: 'As we see in the previous page 👍',
              ),
            ),
            Gap(32),
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('combinable'),
              slidingFrom: Offset(0, 600),
              child: _Item(
                title: 'Tiny, so powerful',
                description:
                    'AnimatedTo is just a widget. Combine whatever widgets you like!',
              ),
            ),
            Gap(32),
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('implicit'),
              slidingFrom: Offset(0, 800),
              child: _Item(
                title: 'Implicit',
                description: 'Let\'s move on to the next page!',
              ),
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
