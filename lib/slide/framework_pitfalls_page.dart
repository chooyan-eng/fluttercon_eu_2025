import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class FrameworkPitfallsPage extends StatelessWidget {
  const FrameworkPitfallsPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      FrameworkPitfallsPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/framework-pitfalls'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Center(
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '🤔 How do we move a widget with animations?',
                    style: FlutterDeckTheme.of(context).textTheme.title,
                  ),
                ),
                const Spacer(),
                Text(
                  'Implicit animation?',
                  style: FlutterDeckTheme.of(context).textTheme.title,
                ),
                Text(
                  '-> No. We don\'t have an implicit "moving" widget',
                  style: FlutterDeckTheme.of(context).textTheme.subtitle,
                ),
                const Gap(120),
                Text(
                  'Explicit animation?',
                  style: FlutterDeckTheme.of(context).textTheme.title,
                ),
                Text(
                  '-> Maybe yes, but how to detect the exact position of an updated widget?',
                  style: FlutterDeckTheme.of(context).textTheme.subtitle,
                ),
                const Gap(60),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
