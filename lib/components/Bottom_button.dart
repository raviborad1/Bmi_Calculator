import 'package:flutter/material.dart';
import '../constants.dart';
class Bottom_button extends StatelessWidget {

  Bottom_button({@required this.title,@required this.ontap});
  final VoidCallback? ontap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: kbottomconcolor,
        child: Center(
          child: Text(
            title!,
            style: klargenumbertextstyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomconheight,
      ),
    );
  }
}
