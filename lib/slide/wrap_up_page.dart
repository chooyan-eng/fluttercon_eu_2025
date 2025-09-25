import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class WrapUpPage extends StatelessWidget {
  const WrapUpPage({super.key});

  static FlutterDeckSlideWidget get slide => WrapUpPage()
      .withSlideConfiguration(FlutterDeckSlideConfiguration(route: '/wrap-up'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Wrap up',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            Gap(60),
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('wrap_up_1'),
              slidingFrom: Offset(0, 200),
              child: _Item(
                title: 'Implicit and Explicit',
                description:
                    'We have 2 approaches for introducing animations with Dart code.',
              ),
            ),
            Gap(32),
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('wrap_up_2'),
              slidingFrom: Offset(0, 400),
              child: _Item(
                title: '"Moving" animations',
                description:
                    'Flutter\'s basic API has difficulties to detect a position before rendered.',
              ),
            ),
            Gap(32),
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('wrap_up_3'),
              slidingFrom: Offset(0, 600),
              child: _Item(
                title: 'Customize RenderObject',
                description:
                    'We always have an option to customize RenderObject as animated_to does.',
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
