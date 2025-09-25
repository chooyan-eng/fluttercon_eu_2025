import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class WithFlutterDeckPage extends StatelessWidget {
  const WithFlutterDeckPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      WithFlutterDeckPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/with-flutter-deck'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: _Item(
                  url: 'assets/mangirdas_photo.jpg',
                  name: 'flutter_deck',
                ),
              ),
            ),
            Text('🤝', style: TextStyle(fontSize: 100)),
            Expanded(
              child: Center(
                child: _Item(url: 'assets/me_photo.jpg', name: 'animated_to'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.url, required this.name});

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 60, foregroundImage: AssetImage(url)),
        Gap(32),
        Text(name, style: FlutterDeckTheme.of(context).textTheme.title),
      ],
    );
  }
}
