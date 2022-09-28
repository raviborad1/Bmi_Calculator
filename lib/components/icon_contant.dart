import 'package:flutter/material.dart';
import '../constants.dart';
class IconContain extends StatelessWidget {
  final IconData? icon;
  final String? label;
  IconContain({this.icon, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon!,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label!,
          style: klabelstyle,
          ),
      ],
    );
  }
}
