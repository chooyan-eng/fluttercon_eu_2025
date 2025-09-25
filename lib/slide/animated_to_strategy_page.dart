import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class AnimatedToStrategyPage extends StatelessWidget {
  const AnimatedToStrategyPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      AnimatedToStrategyPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/animated-to-strategy'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              _WidgetTree(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Icon(Icons.arrow_forward, size: 100),
                  ),
                  Gap(40),
                  _ElementTree(),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Icon(Icons.arrow_forward, size: 100),
                  ),
                  Gap(40),
                  _RenderObjectTree(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WidgetTree extends StatelessWidget {
  const _WidgetTree();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Widget', style: FlutterDeckTheme.of(context).textTheme.bodyLarge),
        Gap(8),
        _WidgetFigure(),
        _Connector(),
        _WidgetFigure(),
        _Connector(),
        _WidgetFigure(),
      ],
    );
  }
}

class _ElementTree extends StatelessWidget {
  const _ElementTree();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Element',
          style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
        ),
        Gap(8),
        _ElementFigure(),
        _Connector(),
        _ElementFigure(),
        _Connector(),
        _ElementFigure(),
      ],
    );
  }
}

class _RenderObjectTree extends StatelessWidget {
  const _RenderObjectTree();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '_RenderAnimatedTo',
          style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
        ),
        Gap(8),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.blue, width: 2),
          ),
          width: 240,
          height: 500,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 32,
              children: [
                Text(
                  'Layout',
                  style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
                ),
                Icon(Icons.arrow_downward, size: 40),
                Text(
                  '**Animation**',
                  style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WidgetFigure extends StatelessWidget {
  const _WidgetFigure();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        border: Border.all(color: Colors.red.shade900, width: 2),
      ),
      width: 200,
      height: 100,
    );
  }
}

class _ElementFigure extends StatelessWidget {
  const _ElementFigure();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        border: Border.all(color: Colors.orange.shade900, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 200,
      height: 100,
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector();

  @override
  Widget build(BuildContext context) {
    return Container(width: 2, height: 100, color: Colors.white);
  }
}
