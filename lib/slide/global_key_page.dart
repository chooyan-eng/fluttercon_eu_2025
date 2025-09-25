import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';

class GlobalKeyPage extends StatelessWidget {
  const GlobalKeyPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      GlobalKeyPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/global-key'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Bonus Tips: GlobalKey',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            Gap(16),
            Text(
              'enables Element and RenderObject to be "cached" and "reused"',
              style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
            ),
            Gap(32),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 60),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(
                      'https://docs.flutter.dev/resources/inside-flutter#tree-surgery',
                    ),
                  ),
                  initialSettings: InAppWebViewSettings(pageZoom: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
