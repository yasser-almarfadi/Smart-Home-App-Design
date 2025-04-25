import 'package:flutter/material.dart';
import 'package:myproject/src/presentation/widgets/sizes.dart';
import 'package:myproject/src/presentation/widgets/tabs/tab.dart';

class TabsCardWidget extends StatelessWidget {
  // final IconData icon;
  // final String title;
  // final List<String>? textButtons;
  // final ValueChanged<bool> onToggle;

  const TabsCardWidget({
    super.key,
    // required this.icon,
    // required this.title,
    // this.numberDevices,
    // this.textButtons,
    // required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: twentyEight, vertical: 10),
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 5,
                child: TabWidget(
                  icon: Icons.thermostat, // Change the icon here
                  title: 'Temperature', // Change the title here
                  isSelected: true,
                  onTap: () {},
                ),
              ),

              // const Expanded(flex: 2, child: const SizedBox(width: 10)),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: TabWidget(
                  icon: Icons.stacked_bar_chart_rounded, // Change the icon here
                  title: 'Statistics', // Change the title here
                  isSelected: false,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
