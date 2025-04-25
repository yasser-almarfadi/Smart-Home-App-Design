import 'package:flutter/material.dart';

class SmartDeviceCard extends StatelessWidget {
  final IconData? icon;
  final String? pathImage;
  final String title;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  const SmartDeviceCard({
    super.key,
    this.pathImage,
    this.icon,
    required this.title,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      // width: 150,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: isOn
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (pathImage != null)
                Image.asset(
                  pathImage!,
                  // width: 80,
                  scale: 1.1,
                  color: isOn
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              if (icon != null)
                Icon(
                  icon,
                  size: 80,
                  color: isOn
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: isOn
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Switch(
                        activeColor: isOn
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.primaryContainer,
                        activeTrackColor: isOn
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                        inactiveThumbColor: isOn
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                        inactiveTrackColor: isOn
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.primaryContainer,
                        value: isOn,
                        onChanged: onToggle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
