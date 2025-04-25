import 'package:myproject/src/presentation/screens/devices_screen.dart';
import 'package:myproject/src/presentation/screens/home_screen.dart';
import 'package:myproject/src/presentation/screens/splash_screen.dart';
import 'package:myproject/src/presentation/screens/temperature_screen.dart';
// import 'package:myproject/src/presentation/screens/web.dart';
import 'package:go_router/go_router.dart';
//

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    // GoRoute(
    //   name: WebScreen.routeName,
    //   path: WebScreen.routeName,
    //   builder: (context, state) => const WebScreen(),
    // ),
    GoRoute(
      name: SplashScreen.routeName,
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: DevicesScreen.routeName,
      path: DevicesScreen.routeName,
      builder: (context, state) => const DevicesScreen(),
    ),
    GoRoute(
      name: TemperatureScreen.routeName,
      path: TemperatureScreen.routeName,
      builder: (context, state) => const TemperatureScreen(),
    ),
  ],
);
