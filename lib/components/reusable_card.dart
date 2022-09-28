import 'package:flutter/material.dart';
class Reuseble extends StatelessWidget {

  Reuseble({this.color, this.cardchild,this.onpress});
  final Color? color;
  final Widget? cardchild;
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,

        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),

          // color: Color(0xFF1D1E33)
          color: color,
        ),
      ),
    );
  }
}