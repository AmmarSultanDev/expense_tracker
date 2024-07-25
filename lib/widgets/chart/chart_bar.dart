import 'package:flutter/material.dart';

/// A widget that represents a bar in a chart.
class ChartBar extends StatelessWidget {
  /// Creates a [ChartBar] widget.
  ///
  /// The [fill] parameter specifies the fill value of the bar.
  const ChartBar({
    Key? key,
    required this.fill,
  }) : super(key: key);

  /// The fill value of the bar.
  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}
