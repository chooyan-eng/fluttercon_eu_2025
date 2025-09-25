import 'dart:async';

import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ImplicitHandyPage extends StatefulWidget {
  const ImplicitHandyPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      ImplicitHandyPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/implicit-handy'),
      );

  @override
  State<ImplicitHandyPage> createState() => _ImplicitHandyPageState();
}

const _code1 = '''
Align(
  alignment: switch (_step % 4) {''';

const _code2 = '''
  child: AnimatedTo.spring(
    globalKey: GlobalObjectKey('circle'),''';

class _ImplicitHandyPageState extends State<ImplicitHandyPage> {
  bool _isAnimation = false;
  double _textOpacity = 0.0;
  int _step = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _step++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() => _isAnimation = !_isAnimation);
          Future.delayed(const Duration(milliseconds: 10), () {
            setState(() => _textOpacity = _isAnimation ? 1.0 : 0.0);
          });
        },
        child: Column(
          children: [
            Text(
              'Handy because Implicit!',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 240,
                  vertical: 120,
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    DefaultTextStyle(
                      style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          border: Border.all(
                            color: Colors.grey.shade900,
                            width: 2,
                          ),
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text0'),
                                child: Text(
                                  _code1,
                                  style:
                                      FlutterDeckTheme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                ),
                              ),
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text1'),
                                child: Text(
                                  '    0 => Alignment.topLeft,',
                                  style: TextStyle(
                                    color: _step % 4 == 0 ? Colors.amber : null,
                                  ),
                                ),
                              ),
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text2'),
                                child: Text(
                                  '    1 => Alignment.topRight,',
                                  style: TextStyle(
                                    color: _step % 4 == 1 ? Colors.amber : null,
                                  ),
                                ),
                              ),
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text3'),
                                child: Text(
                                  '    2 => Alignment.bottomRight,',
                                  style: TextStyle(
                                    color: _step % 4 == 2 ? Colors.amber : null,
                                  ),
                                ),
                              ),
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text4'),
                                child: Text(
                                  '    _ => Alignment.bottomLeft,',
                                  style: TextStyle(
                                    color: _step % 4 == 3 ? Colors.amber : null,
                                  ),
                                ),
                              ),
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text5'),
                                child: Text('  }'),
                              ),
                              if (_isAnimation)
                                AnimatedTo.spring(
                                  globalKey: GlobalObjectKey('AnimatedTo1'),
                                  slidingFrom: const Offset(400, 0),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 800),
                                    opacity: _textOpacity,
                                    child: Text(
                                      _code2,
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                  ),
                                ),
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text6'),
                                child: Text('    child: _Cube(),'),
                              ),
                              if (_isAnimation)
                                AnimatedTo.spring(
                                  globalKey: GlobalObjectKey('AnimatedTo2'),
                                  slidingFrom: const Offset(400, 0),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 800),
                                    opacity: _textOpacity,
                                    child: Text(
                                      '  ),',
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                  ),
                                ),
                              AnimatedTo.spring(
                                globalKey: GlobalObjectKey('text7'),
                                child: Text('),'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: switch (_step % 4) {
                          0 => Alignment.topLeft,
                          1 => Alignment.topRight,
                          2 => Alignment.bottomRight,
                          _ => Alignment.bottomLeft,
                        },
                        child: AnimatedTo.spring(
                          globalKey: GlobalObjectKey('circle'),
                          enabled: _isAnimation,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.amber[400]!,
                                  Colors.orange[500]!,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.amber[600]!,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amber.withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
