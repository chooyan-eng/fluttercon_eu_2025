import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AnimatedToPage extends StatefulWidget {
  const AnimatedToPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      AnimatedToPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/animated-to'),
      );

  @override
  State<AnimatedToPage> createState() => _AnimatedToPageState();
}

class _AnimatedToPageState extends State<AnimatedToPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Stack(
              children: [
                AnimatedTo.spring(
                  globalKey: GlobalObjectKey('container'),
                  slidingFrom: Offset(1000, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    height: 120,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: AnimatedTo.spring(
                      globalKey: GlobalObjectKey('text'),
                      slidingFrom: Offset(3000, 0),
                      child: Text(
                        'animated_to',
                        style: FlutterDeckTheme.of(
                          context,
                        ).textTheme.title.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
