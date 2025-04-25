import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/src/presentation/screens/home_screen.dart';
import 'package:myproject/src/presentation/widgets/sizes.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(milliseconds: oneThousandFiveHundredInt), () {
      if (context.mounted) {
        // context.pushReplacementNamed(TemperatureScreen.routeName);
        // context.pushReplacementNamed(DevicesScreen.routeName);
        context.pushReplacementNamed(HomeScreen.routeName);
      }
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: twoHundred,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
