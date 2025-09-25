import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class RenderObjectPage extends StatefulWidget {
  const RenderObjectPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      RenderObjectPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/render-object'),
      );

  @override
  State<RenderObjectPage> createState() => _RenderObjectPageState();
}

class _RenderObjectPageState extends State<RenderObjectPage> {
  bool _showNext = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _showNext = !_showNext);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedTo.spring(
                globalKey: GlobalObjectKey('render-object'),
                slidingFrom: Offset(600, 0),
                child: Text(
                  'RenderObject',
                  style: FlutterDeckTheme.of(context).textTheme.title,
                ),
              ),
              Gap(32),
              if (_showNext)
                AnimatedTo.spring(
                  globalKey: GlobalObjectKey('render-object-but'),
                  slidingFrom: Offset(0, 600),
                  child: Text(
                    'but...',
                    style: FlutterDeckTheme.of(context).textTheme.subtitle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
