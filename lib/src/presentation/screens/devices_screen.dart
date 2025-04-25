import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/src/application/riverpod/app_riverpod.dart';
import 'package:myproject/src/presentation/widgets/cards/control_device_card.dart';
import 'package:myproject/src/presentation/widgets/second_appbar.dart';

class DevicesScreen extends ConsumerWidget {
  static const routeName = '/devices-screen';

  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isExpanded = ref.watch(isExpandedProvider);
    final scrollController = ref.watch(scrollControllerProvider);

    scrollController.addListener(() {
      ref.read(isExpandedProvider.notifier).state =
          scrollController.hasClients && scrollController.offset < 140;
    });
    return Scaffold(
        body: CustomScrollView(
      controller: scrollController,
      slivers: [
        SecondAppbarWidget(
          title: 'Devices',
          subtitle: 'Connected Room',
          isExpanded: isExpanded,
          onBackPressed: () {
            context.pop();
          },
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              ControlDeviceCard(
                pathImage: 'assets/icons/smart-light.png',
                // icon: Icons.live_tv,
                title: 'Smart Light',
                textButtons: const ['Bedroom', 'Livingroom'],
                isOn: true,
                numberDevices: 2,
                onToggle: (value) {
                  //
                },
              ),
              ControlDeviceCard(
                pathImage: 'assets/icons/smart-tv.png',
                // icon: Icons.home_max_outlined,
                title: 'Smart TV',
                isOn: false,
                onToggle: (value) {
                  //
                },
              ),
              ControlDeviceCard(
                pathImage: 'assets/icons/smart-ac.png',
                // icon: Icons.notifications_active_outlined,
                title: 'Smart AC',
                isOn: false,
                onToggle: (value) {
                  //
                },
              ),
              ControlDeviceCard(
                pathImage: 'assets/icons/smart-light2.png',
                // icon: Icons.ac_unit_outlined,
                title: 'Smart Light',
                isOn: false,
                onToggle: (value) {
                  //
                },
              ),
              //?=====
            ],
          ),
        )
      ],
    ));
  }
}
