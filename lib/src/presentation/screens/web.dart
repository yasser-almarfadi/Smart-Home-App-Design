import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myproject/src/presentation/widgets/sizes.dart';

class WebScreen extends ConsumerWidget {
  const WebScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
          image: DecorationImage(
            image: Image.asset(
              'assets/images/bg.png',
              // fit: BoxFit.contain,
            ).image,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildScreenImageMethod('assets/images/screen1.png'),
              buildScreenImageMethod('assets/images/screen.png'),
              buildScreenImageMethod('assets/images/screen2.png'),
            ],
          ),
        ),
      ),
    );
  }

  DecoratedBox buildScreenImageMethod(String pathImage) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fifteen),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: ten,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(fifteen),
        child: Image.asset(
          pathImage,
        ),
      ),
    );
  }
}
