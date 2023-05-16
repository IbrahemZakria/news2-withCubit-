import 'package:flutter/material.dart';

class default_button extends StatelessWidget {
  default_button(
      {required this.ontap,
     this. color = Colors.blue,
      required this.text,
      this.width = double.infinity});
  double width;
  Color color;
  Function ontap;
  Text text;
  @override
  Container build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
        top: 10,
      ),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Center(
        child: InkWell(
          onTap: () {
            ontap();
          },
          child: Text(
            '$text',
          ),
        ),
      ),
    );
  }
}
