import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/src/application/riverpod/app_riverpod.dart';
import 'package:myproject/src/presentation/widgets/second_appbar.dart';
import 'package:myproject/src/presentation/widgets/tabs/tabs.dart';
import 'package:myproject/src/presentation/widgets/temperature_control_widget.dart';
import '../widgets/cards/temperature_card_widget.dart';
import '../widgets/sizes.dart';

class TemperatureScreen extends ConsumerWidget {
  static const routeName = '/temperature-screen';
  const TemperatureScreen({super.key});

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
          title: 'Temperature',
          subtitle: 'Living Room',
          isExpanded: isExpanded,
          onBackPressed: () {
            context.pop();
          },
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const TabsCardWidget(),
              const SizedBox(height: twenty),
              const TemperatureControlWidget(),
              const SizedBox(height: twenty),
              _buildCurrentsMethod(context),
              const SizedBox(height: twenty),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TemperatureCardWidget(
                      title: 'Heating',
                      degree: 26,
                      selected: true,
                    ),
                  ),
                  Expanded(
                    child: TemperatureCardWidget(
                      title: 'Cooling',
                      degree: 18,
                    ),
                  ),
                  Expanded(
                    child: TemperatureCardWidget(
                      title: 'Airwave',
                      degree: 20,
                    ),
                  ),
                ],
              ),
              //
            ],
          ),
        )
      ],
    ));
  }

  Padding _buildCurrentsMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: twenty, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Temp',
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '▴ 26°C',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Current Humidily',
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '▾ 57%',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
