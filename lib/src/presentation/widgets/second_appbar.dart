import 'package:flutter/material.dart';

class SecondAppbarWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isExpanded;
  final VoidCallback onBackPressed;

  const SecondAppbarWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isExpanded,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 140,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: onBackPressed,
      ),
      title: isExpanded
          ? null
          : Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              textAlign: TextAlign.right,
            ),
      centerTitle: true,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: isExpanded
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 27,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    if (isExpanded)
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              )
            : null,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Handle more options
          },
        ),
      ],
    );
  }
}
