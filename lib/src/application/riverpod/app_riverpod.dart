import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final scrollControllerProvider =
    StateProvider<ScrollController>((ref) => ScrollController());
final isExpandedProvider = StateProvider<bool>((ref) => true);

// select index screen in Main Screen
final selectedIndexScreen = StateProvider((ref) => 0);
// end select index screen in Main Screen

// Button Loading
final isLoadingProvider = StateProvider<bool>(
  (ref) => false,
);
// End Button Loading

// Language
class IsEnglishNotifier extends StateNotifier<bool> {
  IsEnglishNotifier(super.state) {
    SharedPreferences.getInstance().then(
      (prefs) {
        state = prefs.getBool('isEnglish') ?? false;
      },
    );
  }

  setValue(bool isEnglish) async {
    state = isEnglish;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isEnglish', isEnglish);
  }

  Future<bool> getValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isEnglish') ?? false;
  }
}

final isEnglishProvider = StateNotifierProvider<IsEnglishNotifier, bool>(
    (ref) => IsEnglishNotifier(false));

// End Language

// Theme Mode

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier(super.state) {
    SharedPreferences.getInstance().then((value) {
      state = value.getBool('dark') ?? false;
    });
  }

  setValue(bool dark) async {
    final prefs = await SharedPreferences.getInstance();
    state = dark;
    prefs.setBool('dark', dark);
  }

  Future<bool> getValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('dark') ?? false;
  }
}

final isDarkProvider = StateNotifierProvider<DarkModeNotifier, bool>(
    (ref) => DarkModeNotifier(false));
// End Theme Mode

// Start Connectivity
enum NetworkStatus { notDetermined, on, off }

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  NetworkDetectorNotifier() : super(NetworkStatus.notDetermined) {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        NetworkStatus newState;
        switch (result.first) {
          case ConnectivityResult.mobile:
          case ConnectivityResult.wifi:
            newState = NetworkStatus.on;
            break;
          case ConnectivityResult.none:
            newState = NetworkStatus.off;
            break;
          default:
            newState = NetworkStatus.off;
            break;
        }

        if (newState != state) {
          state = newState;
        }
      },
    );
  }
}

final networkAwareProvider =
    StateNotifierProvider<NetworkDetectorNotifier, NetworkStatus>(
  (ref) {
    return NetworkDetectorNotifier();
  },
);
// END CONNECTIVITY

