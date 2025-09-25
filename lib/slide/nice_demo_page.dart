import 'dart:math';

import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class NiceDemoPage extends StatefulWidget {
  const NiceDemoPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      NiceDemoPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/nice-demo'),
      );

  @override
  State<NiceDemoPage> createState() => _NiceDemoPageState();
}

const _delay = Duration(milliseconds: 150);
const _elementCount = 20;

class _NiceDemoPageState extends State<NiceDemoPage> {
  List<int> _numbers = [];
  int? _comparingNum;
  int? _comparedNum;

  @override
  void initState() {
    super.initState();
    _resetNumbers(); // Initialize numbers on app start
  }

  void _resetNumbers() {
    final random = Random();
    setState(() {
      _numbers =
          List<int>.generate(
            _elementCount,
            (index) => random.nextInt(90) + 10, // Numbers between 10 and 99
          ).toSet().toList(); // Ensure unique numbers
      _comparingNum = null; // Clear comparison indicators
      _comparedNum = null;
    });
  }

  int get _maxNumber =>
      _numbers.isEmpty
          ? 100
          : _numbers.reduce((prev, number) => max(prev, number));

  void _updateComparison(int? comparing, int? compared) {
    setState(() {
      _comparingNum = comparing;
      _comparedNum = compared;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(120),
        child: Center(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .center, // Center bars if fewer than _elementCount
            crossAxisAlignment:
                CrossAxisAlignment.end, // Align bars to the bottom
            children:
                _numbers.asMap().entries.map<Widget>((entry) {
                  final number =
                      entry.value; // Use number as identifier for animated keys
                  return Expanded(
                    child: _BarWidget(
                      number: number,
                      maxNumber: _maxNumber,
                      isComparing:
                          number ==
                          _comparingNum, // Use number for comparison state
                      isCompared:
                          number ==
                          _comparedNum, // Use number for comparison state
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _quickSort,
        tooltip: 'Start Quick Sort',
        label: const Text('Sort'),
        icon: const Icon(Icons.sort),
        backgroundColor: Colors.deepPurpleAccent, // Vibrant button color
        foregroundColor: Colors.white,
      ),
    );
  }

  /// The sort algorithm is implemented by Gemini. Thanks Gemini!

  // Initiates the Quick Sort algorithm on the _numbers list.
  Future<void> _quickSort() async {
    if (_numbers.isEmpty || _numbers.length == 1) {
      return; // Nothing to sort if list is empty or has one element
    }
    // Deep copy to prevent issues with _numbers list changing during recursion
    List<int> currentNumbers = List.from(_numbers);

    await _quickSortRecursive(currentNumbers, 0, currentNumbers.length - 1);
    // After sorting, update the original _numbers list
    setState(() {
      _numbers = currentNumbers;
    });

    // Clear any comparison indicators after sort completes.
    _updateComparison(null, null);
  }

  // Recursive helper function for Quick Sort.
  Future<void> _quickSortRecursive(List<int> list, int low, int high) async {
    if (low < high) {
      int pivotIndex = await _partition(list, low, high);
      await _quickSortRecursive(list, low, pivotIndex - 1);
      await _quickSortRecursive(list, pivotIndex + 1, high);
    }
  }

  // Partitions the array around a pivot element for Quick Sort.
  Future<int> _partition(List<int> list, int low, int high) async {
    int pivotValue = list[high]; // Use the value of the pivot
    int i = (low - 1); // Index of smaller element

    for (int j = low; j < high; j++) {
      // Highlight the elements being compared by their values
      _updateComparison(list[j], pivotValue);
      await Future<void>.delayed(_delay); // Small delay to visualize comparison

      // If current element is smaller than or equal to pivot
      if (list[j] <= pivotValue) {
        i++;
        // Swap list[i] and list[j]
        if (i != j) {
          setState(() {
            final temp = list[i];
            list[i] = list[j];
            list[j] = temp;
            _numbers = List.from(list); // Update _numbers to trigger UI refresh
          });
          await Future<void>.delayed(_delay); // Small delay for visualization
        }
      }
    }

    // Swap list[i+1] and list[high] (pivot)
    if (i + 1 != high) {
      setState(() {
        final temp = list[i + 1];
        list[i + 1] = list[high];
        list[high] = temp;
        _numbers = List.from(list); // Update _numbers to trigger UI refresh
      });
      await Future<void>.delayed(_delay); // Small delay for visualization
    }

    return i + 1;
  }
}

/// A widget to display a single bar in the visualization.
class _BarWidget extends StatelessWidget {
  final int number;
  final int maxNumber;
  final bool isComparing;
  final bool isCompared;

  const _BarWidget({
    required this.number,
    required this.maxNumber,
    required this.isComparing,
    required this.isCompared,
  });

  // Generates a color for a bar based on its value relative to the maximum number.
  // Colors transition from a vibrant green (lower values) to a warm orange-red (higher values).
  Color _generateColor(int base) {
    final ratio = base / maxNumber.toDouble();
    return Color.lerp(
      Colors.lightGreenAccent.shade400,
      Colors.deepOrange.shade700,
      ratio,
    )!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:
          MainAxisSize.min, // Column only takes up space needed by its children
      mainAxisAlignment: MainAxisAlignment.end, // Align children to the bottom
      children: [
        // Number Text: Animated when the underlying number changes
        AnimatedTo.curve(
          globalKey: GlobalObjectKey(
            'text_value_$number',
          ), // Unique key for text based on number
          duration: _delay,
          curve: Curves.easeOutQuad,
          child: Text(
            number.toString(),
            style: const TextStyle(
              color: Colors.white, // High contrast text for dark background
              fontWeight: FontWeight.bold,
              fontSize: 16,
              shadows: [
                Shadow(
                  blurRadius: 2.0,
                  color: Colors.black87,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8), // Spacing between number and bar
        // The Bar itself: Animated for height and position changes
        Container(
          height: 400, // Fixed "canvas" height for the bar animation
          alignment: Alignment.bottomCenter, // Bar grows upwards
          child: AnimatedTo.curve(
            globalKey: GlobalObjectKey(
              number,
            ), // Key for bar identity (for reordering animation)
            duration: _delay,
            curve:
                Curves.easeInOutBack, // Bouncy/dynamic curve for height changes
            child: Container(
              width: double.infinity, // Bar takes full width within its parent
              height: max(
                1.0,
                380.0 * number / maxNumber,
              ), // Ensure minimum height of 1px
              decoration: BoxDecoration(
                color: _generateColor(number),
                borderRadius: BorderRadius.circular(8), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ), // Horizontal spacing between bars
            ),
          ),
        ),
        const SizedBox(height: 8), // Spacing between bar and indicator
        // Comparison Indicator: Animates in/out, changes color based on state
        AnimatedTo.curve(
          globalKey: GlobalObjectKey(
            'indicator_$number',
          ), // Unique key for this specific bar's indicator
          duration: _delay,
          curve: Curves.easeOutBack, // Pop effect for indicator
          child: Container(
            height:
                (isComparing || isCompared)
                    ? 12
                    : 0, // Animate height to make it visible
            width:
                (isComparing || isCompared)
                    ? 12
                    : 0, // Animate width to maintain circle shape
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isComparing
                      ? Colors
                          .blue
                          .shade300 // Bright blue for comparing
                      : Colors.deepPurple.shade300, // Deep purple for compared
              boxShadow:
                  (isComparing || isCompared)
                      ? [
                        BoxShadow(
                          color: (isComparing
                                  ? Colors.blue.shade300
                                  : Colors.deepPurple.shade300)
                              .withValues(alpha: 0.7),
                          blurRadius: 10,
                          spreadRadius: 3,
                        ),
                      ]
                      : null, // No shadow when not active
            ),
          ),
        ),
      ],
    );
  }
}
