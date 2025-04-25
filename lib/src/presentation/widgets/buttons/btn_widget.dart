import 'package:flutter/material.dart';
import 'package:myproject/src/presentation/widgets/sizes.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, ten, 13, fifteen),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: ten),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
