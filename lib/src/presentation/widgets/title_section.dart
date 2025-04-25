import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget(
    this.data, {
    super.key,
    this.dataAr,
    this.color,
    this.bottom,
    this.fontSize,
  });
  final String data;
  final String? dataAr;
  final Color? color;
  final double? bottom;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 15, bottom: bottom ?? 10, left: 10, right: 10),
      child: dataAr == null
          ? Text(
              data,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: fontSize ?? 22,
                color: color ?? Theme.of(context).colorScheme.onBackground,
              ),
              textAlign: TextAlign.right,
            )
          : Text(
              data,
              // dataAr ?? data,
              // fontWeight: FontWeight.bold,
              // fontSize: 20,
              // textAlign: TextAlign.right,
              // color: color,
            ),
    );
  }
}
