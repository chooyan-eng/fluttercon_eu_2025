import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';

class WhatIsImplicitPage extends StatelessWidget {
  const WhatIsImplicitPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      WhatIsImplicitPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/what-is-implicit'),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              'What is implicit?',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            Gap(32),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri('https://docs.flutter.dev/ui/animations'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
