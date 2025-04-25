import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myproject/src/application/riverpod/temperature_riverpod.dart';
import 'package:myproject/src/presentation/widgets/sizes.dart';

class TemperatureControlWidget extends ConsumerWidget {
  const TemperatureControlWidget({super.key});

  // double _temperature = 22;
  final double _minTemperature = 14;
  final double _maxTemperature = 28;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _temperature = ref.watch(temperatureProvider);
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 230,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(28),
                // shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(28),
                    // shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 45,
                    ),
                    child: Text(
                      '${_temperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: twenty),
            RotatedBox(
              quarterTurns: -1,
              child: Slider(
                label: '${_temperature.toStringAsFixed(1)}°C',
                value: _temperature,
                min: _minTemperature,
                max: _maxTemperature,
                divisions: (_maxTemperature - _minTemperature).toInt(),
                onChanged: (double newValue) {
                  ref.read(temperatureProvider.notifier).state = newValue;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
