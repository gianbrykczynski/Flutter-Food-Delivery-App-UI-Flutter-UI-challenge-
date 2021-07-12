import 'package:flutter/material.dart';

import 'package:flutter_pizza_app/colors.dart';

//Definição das Variaveis da classe.
class PrimaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final double height;
  //Construtor da classe.
  const PrimaryText({
    this.text,
    this.color: AppColors.secondary,
    this.size: 20,
    this.height: 1.3,
    this.fontWeight: FontWeight.w400,
  });
  //Widget que retorna os parametros da classe acima.
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'Poppins',
          height: height),
    );
  }
}
