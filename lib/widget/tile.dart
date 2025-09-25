import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Tile extends StatelessWidget {
  const Tile(this.index, {super.key, this.onTap});

  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 60),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[600]!),
        ),
        child: Center(
          child: Text(
            'Item $index',
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
