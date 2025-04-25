import 'package:flutter/material.dart';

class TemperatureCardWidget extends StatelessWidget {
  final String title;
  final int degree;
  final bool selected;

  const TemperatureCardWidget({
    super.key,
    required this.title,
    required this.degree,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    // Define colors based on the 'selected' state
    final backgroundColor = selected
        ? Theme.of(context).colorScheme.onPrimaryContainer
        : Theme.of(context).colorScheme.primaryContainer;
    // final textColor = selected
    //     ? Theme.of(context).colorScheme.primaryContainer
    //     : Theme.of(context).colorScheme.onPrimaryContainer;
    final subTextColor = selected
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.onPrimaryContainer;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 130, // or your variable 'oneHundred'
        width: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '$degree°C',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: subTextColor,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
