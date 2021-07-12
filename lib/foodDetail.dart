import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_pizza_app/colors.dart';
import 'package:flutter_pizza_app/constant.dart';
import 'package:flutter_pizza_app/style.dart';

class FoodDetail extends StatelessWidget {
  //criar a variavél.
  final String imagePath;
  final String name;
  //criar o construtor.
  FoodDetail(this.imagePath, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  //Passar a variavél.
                  text: name,
                  size: 40,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/dollar.svg',
                      width: 15,
                      color: AppColors.tertiary,
                    ),
                    PrimaryText(
                      text: '18,99',
                      size: 35,
                      fontWeight: FontWeight.w800,
                      color: AppColors.tertiary,
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: 'Tamanho',
                            size: 18,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: 'Médio 8/fts',
                            size: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 20),
                          PrimaryText(
                            text: 'Massa',
                            size: 18,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: 'Massa Alta',
                            size: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 20),
                          PrimaryText(
                            text: 'Delivery',
                            size: 18,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: '20-30/min',
                            size: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.lightGray, blurRadius: 50),
                          ],
                        ),
                        child: Hero(
                          tag: imagePath,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50),
            child: PrimaryText(
              text: 'Ingredientes',
              size: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: ingredientCard(ingredients[index]['imagePath']),
              ),
              //children: [
              //  ingredientCard(),
              //],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryText(
                    text: 'Comprar',
                    fontWeight: FontWeight.w800,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.secondary,
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 45),
                primary: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container ingredientCard(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 15, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 3)],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Image.asset(imagePath, width: 90),
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => {
              Navigator.pop(context),
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.chevron_left),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary,
            ),
            child: Icon(
              Icons.star,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
