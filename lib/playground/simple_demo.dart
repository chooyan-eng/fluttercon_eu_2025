import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class SimpleDemo extends StatefulWidget {
  const SimpleDemo({super.key});

  static FlutterDeckSlideWidget get slide =>
      SimpleDemo().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/simple-demo'),
      );

  @override
  State<SimpleDemo> createState() => _SimpleDemoState();
}

class _SimpleDemoState extends State<SimpleDemo> {
  bool _horizontal = true;

  @override
  Widget build(BuildContext context) {
    final children =
        [
              'https://pbs.twimg.com/profile_images/1618172499052593152/kBjTtVob_400x400.jpg',
              'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png',
              'https://storage.googleapis.com/cms-storage-bucket/shadow-dash.d406c736e7c4c57f5f61.png',
              'https://avatars.githubusercontent.com/u/1609975?s=280&v=4',
            ]
            .map(
              (url) => AnimatedTo.spring(
                globalKey: GlobalObjectKey(url),
                child: Image.network(
                  url,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList();
    return GestureDetector(
      onTap: () {
        setState(() => _horizontal = !_horizontal);
      },
      child: Scaffold(
        body: Center(
          child:
              _horizontal
                  ? Row(
                    spacing: 16,
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  )
                  : Column(
                    spacing: 16,
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  ),
        ),
      ),
    );
  }
}
