import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class ImplicitExplicitPage extends StatefulWidget {
  const ImplicitExplicitPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      ImplicitExplicitPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/implicit-explicit'),
      );

  @override
  State<ImplicitExplicitPage> createState() => _ImplicitExplicitPageState();
}

class _ImplicitExplicitPageState extends State<ImplicitExplicitPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Explicit vs Implicit',
              style: FlutterDeckTheme.of(context).textTheme.title.copyWith(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: _ExplicitExample(),
              ),
            ),
            const Gap(40),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: _ImplicitExample(),
              ),
            ),
            const Gap(60),
          ],
        ),
      ),
    );
  }
}

class _ImplicitExample extends StatefulWidget {
  const _ImplicitExample();

  @override
  State<_ImplicitExample> createState() => _ImplicitExampleState();
}

const _code1 = '''
Container(
  ''';

const _code2 = '''
  decoration: BoxDecoration(
    color: Colors.red.shade100,
  ),
  width: _isLong ? ''';

class _ImplicitExampleState extends State<_ImplicitExample>
    with TickerProviderStateMixin {
  bool _isLong = false;
  bool _isAnimation = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        spacing: 32,
        children: [
          Expanded(
            flex: 3,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setState(() => _isLong = !_isLong);
                },
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue[50]!, Colors.purple[50]!],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue[200]!, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Implicit Animation',
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: AnimatedBuilder(
                          animation: _pulseAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _isLong ? _pulseAnimation.value : 1.0,
                              child: AnimatedContainer(
                                duration:
                                    _isAnimation
                                        ? const Duration(milliseconds: 500)
                                        : Duration.zero,
                                curve: Curves.elasticOut,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red[300]!,
                                      Colors.pink[300]!,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.red[600]!,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.red.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                width: _isLong ? 300 : 100,
                                height: 60,
                                child: Center(
                                  child: Text(
                                    _isLong ? 'Extended!' : 'Compact',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setState(() => _isAnimation = !_isAnimation);
                },
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _isAnimation ? Colors.orange : Colors.grey[700]!,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          style: FlutterDeckTheme.of(context)
                              .textTheme
                              .bodyMedium
                              .copyWith(fontFamily: 'monospace', height: 1.4),
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Animated',
                                style: TextStyle(
                                  color:
                                      _isAnimation
                                          ? Colors.orange
                                          : Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: _code1,
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text:
                                    'duration: const Duration(milliseconds: 500),',
                                style: TextStyle(
                                  color:
                                      _isAnimation
                                          ? Colors.orange
                                          : Colors.grey[800],
                                  fontWeight:
                                      _isAnimation
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          style: FlutterDeckTheme.of(context)
                              .textTheme
                              .bodyMedium
                              .copyWith(fontFamily: 'monospace', height: 1.4),
                          TextSpan(
                            children: [
                              TextSpan(
                                text: _code2,
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: '300',
                                style: TextStyle(
                                  color:
                                      _isLong ? Colors.cyan : Colors.grey[500],
                                  fontWeight: _isLong ? FontWeight.bold : null,
                                ),
                              ),
                              TextSpan(
                                text: ' : ',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: '100',
                                style: TextStyle(
                                  color:
                                      _isLong ? Colors.grey[500] : Colors.cyan,
                                  fontWeight: _isLong ? null : FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '\n  height: 60,',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '),',
                          style: FlutterDeckTheme.of(
                            context,
                          ).textTheme.bodyMedium.copyWith(
                            fontFamily: 'monospace',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExplicitExample extends StatefulWidget {
  const _ExplicitExample();

  @override
  State<_ExplicitExample> createState() => _ExplicitExampleState();
}

const _code3 = '''

Container(
  decoration: BoxDecoration(
    color: Colors.red.shade100,
    border: Border.all(color: Colors.red.shade900, width: 2),
  ),
  width: ''';

class _ExplicitExampleState extends State<_ExplicitExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  bool _isLong = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 100,
      upperBound: 300,
    )..addListener(() {
      setState(() {});
    });

    _colorAnimation = ColorTween(
      begin: Colors.orange[300],
      end: Colors.red[300],
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        spacing: 32,
        children: [
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (_isLong) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                  _isLong = !_isLong;
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color:
                          _controller.isAnimating
                              ? Colors.orange
                              : Colors.grey[700]!,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          style: FlutterDeckTheme.of(context)
                              .textTheme
                              .bodyMedium
                              .copyWith(fontFamily: 'monospace', height: 1.4),
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'late final AnimationController _controller;\n',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: _code3,
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: ' _controller.value,',
                                style: TextStyle(
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' // ${_controller.value.toStringAsFixed(1)}',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              TextSpan(
                                text: '\n  height: 60,\n),',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange[50]!, Colors.red[50]!],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange[200]!, width: 2),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Explicit Animation',
                        style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedBuilder(
                      animation: _colorAnimation,
                      builder: (context, child) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                _colorAnimation.value ?? Colors.orange[300]!,
                                Colors.deepOrange[300]!,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.deepOrange[600]!,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          width: _controller.value,
                          height: 60,
                          child: Center(
                            child: Text(
                              '${_controller.value.toInt()}px',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      },
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
