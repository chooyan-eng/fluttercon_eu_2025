import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MoveBasicPage extends StatelessWidget {
  const MoveBasicPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      MoveBasicPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/move-basic'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(
                  'https://dartpad.dev/?id=23742eb4852c539ed11ff57071840950',
                ),
              ),
              initialSettings: InAppWebViewSettings(pageZoom: 1.5),
            ),

            Positioned(
              right: 20,
              top: 20,
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/first_demo_qr.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
