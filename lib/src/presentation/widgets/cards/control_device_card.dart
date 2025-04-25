import 'package:flutter/material.dart';
import 'package:myproject/src/presentation/widgets/sizes.dart';

class ControlDeviceCard extends StatelessWidget {
  final IconData? icon;
  final String? pathImage;
  final String title;
  final List<String>? textButtons;
  final int? numberDevices;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  const ControlDeviceCard({
    super.key,
    this.pathImage,
    this.icon,
    required this.title,
    this.numberDevices,
    this.textButtons,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      // color: Colors.amber,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 120,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (pathImage != null)
                          Image.asset(
                            pathImage!,
                            // width: 40,
                            scale: 2.5,
                            color: isOn
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                          ),
                        if (icon != null)
                          Icon(
                            icon,
                            size: 40,
                            color: isOn
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                          ),
                        if (isOn && numberDevices != null)
                          Text(
                            '$numberDevices',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const Expanded(flex: 2, child: const SizedBox(width: 10)),
            const SizedBox(width: 10),
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isOn ? 'Connected' : 'Not Connected',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Color(0xFF9E9E9E),
                                // color: isOn
                                //     ? Theme.of(context).colorScheme.primaryContainer
                                //     : Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                // color: isOn
                                //     ? Theme.of(context).colorScheme.primaryContainer
                                //     : Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Switch(
                          value: isOn,
                          onChanged: onToggle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: ten),
                  if (textButtons != null)
                    SizedBox(
                      height: 42,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: ten),
                        itemCount: textButtons!.length,
                        itemBuilder: (context, index) {
                          final text = textButtons![index];
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              shadowColor: Theme.of(context).colorScheme.shadow,
                            ),
                            child: Text(text),
                          );
                        },
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
