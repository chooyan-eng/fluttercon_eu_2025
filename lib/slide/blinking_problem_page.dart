import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BlinkingProblemPage extends StatefulWidget {
  const BlinkingProblemPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      BlinkingProblemPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/blinking-problem'),
      );

  @override
  State<BlinkingProblemPage> createState() => _BlinkingProblemPageState();
}

const _code1 = '''
Align(
  alignment: switch (_step % 4) {''';

const _code2 = '''
  child: AnimatedTo.spring(
    globalKey: GlobalObjectKey('circle'),''';

class _BlinkingProblemPageState extends State<BlinkingProblemPage>
    with TickerProviderStateMixin {
  bool _isAnimation = false;
  double _textOpacity = 0.0;
  int _step = 0;
  Timer? _timer;
  Offset? _currentOffset;

  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 1), () {
        _moveToNext();
      });
    });
  }

  void _moveToNext() {
    _animationController?.dispose();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    final currentPosition = _getPosition();
    setState(() {
      _step++;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final nextPosition = _getPosition();
      late Animation<Offset> animation;
      animation =
          Tween<Offset>(
              begin: Offset.zero,
              end: nextPosition - currentPosition,
            ).animate(_animationController!)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                Timer(const Duration(seconds: 1), () {
                  _moveToNext();
                });
              }
            })
            ..addListener(() {
              setState(() {
                _currentOffset =
                    nextPosition - currentPosition - animation.value;
              });
            });
      _animationController?.forward();
    });
  }

  Offset _getPosition() {
    return (GlobalObjectKey(
              'explicit_circle',
            ).currentContext?.findRenderObject()
            as RenderBox)
        .localToGlobal(Offset.zero);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Problem of "Blinking"',
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
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: switch (_step % 4) {
                        0 => Alignment.topLeft,
                        1 => Alignment.topRight,
                        2 => Alignment.bottomRight,
                        _ => Alignment.bottomLeft,
                      },
                      child: Transform.translate(
                        offset: Offset.zero - (_currentOffset ?? Offset.zero),
                        child: Container(
                          key: GlobalObjectKey('explicit_circle'),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.amber[400]!, Colors.orange[500]!],
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
    );
  }
}
