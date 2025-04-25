import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/src/presentation/screens/devices_screen.dart';
import 'package:myproject/src/presentation/screens/temperature_screen.dart';
import 'package:myproject/src/presentation/widgets/cards/smart_devices_card.dart';
import 'package:myproject/src/presentation/widgets/title_section.dart';
import '../widgets/sizes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const MainWidget(),
              InkWell(
                onTap: () {
                  context.pushNamed(DevicesScreen.routeName);
                },
                child: const TitleSectionWidget('Smart Devices'),
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // العرض الأقصى لكل عنصر
                  childAspectRatio: 2 / 2.4, // نسبة العرض إلى الارتفاع لكل عنصر
                  crossAxisSpacing: 10, // المسافة الأفقية بين العناصر
                  mainAxisSpacing: 10, // المسافة الرأسية بين العناصر
                ),
                padding: const EdgeInsets.all(10),
                children: [
                  SmartDeviceCard(
                    pathImage: 'assets/icons/smart-light.png',
                    // icon: Icons.notifications_active_outlined,
                    title: 'Smart Light',
                    isOn: true,
                    onToggle: (value) {
                      //
                    },
                  ),
                  SmartDeviceCard(
                    pathImage: 'assets/icons/smart-ac.png',
                    // icon: Icons.home_max_outlined,
                    title: 'Smart AC',
                    isOn: false,
                    onToggle: (value) {
                      //
                    },
                  ),
                  SmartDeviceCard(
                    pathImage: 'assets/icons/smart-tv.png',
                    // icon: Icons.live_tv,
                    title: 'Smart TV',
                    isOn: false,
                    onToggle: (value) {
                      //
                    },
                  ),
                  SmartDeviceCard(
                    pathImage: 'assets/icons/smart-light2.png',
                    // icon: Icons.ac_unit_outlined,
                    title: 'Smart Light',
                    isOn: false,
                    onToggle: (value) {
                      //
                    },
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

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(ten, fifteen, ten, ten),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(TemperatureScreen.routeName);
                    },
                    child: Image.asset(
                      'assets/icons/menu.png',
                      width: 45,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: twenty),
          ],
        ),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(ten, ten, ten, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Home',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'Yasser Almarfadi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          // textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Image.asset(
                    'assets/images/smart-home.png',
                    width: 170,
                  ),
                ),
              ],
            ),
            const SizedBox(height: twenty),
          ],
        ),
      ),
    );
  }
}
