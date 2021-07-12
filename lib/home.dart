import 'package:flutter/material.dart';
import 'package:flutter_pizza_app/colors.dart';
import 'package:flutter_pizza_app/constant.dart';
import 'package:flutter_pizza_app/foodDetail.dart';
import 'package:flutter_pizza_app/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedCategoryCard = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: AppColors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/foto_gian.jpeg'),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/menu.svg'))
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Pizzas Yumy',
                  size: 20,
                  fontWeight: FontWeight.w500,
                ),
                PrimaryText(
                  text: 'Delivery',
                  size: 35,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 25),
              Icon(
                Icons.search,
                color: AppColors.secondary,
                size: 25,
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.lightGray,
                      ),
                    ),
                    hintText: 'Escolha',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGray,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: PrimaryText(
              text: 'Categorias',
              fontWeight: FontWeight.bold,
              size: 20,
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodCategoryList.length,
              itemBuilder: (context, index) => foodCategoryCard(
                  foodCategoryList[index]['imagePath'],
                  foodCategoryList[index]['name'],
                  index),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: PrimaryText(
              text: 'Populares',
              fontWeight: FontWeight.bold,
              size: 20,
            ),
          ),
          Column(
            children: List.generate(
              popularFoodList.length,
              (index) => popularFoodCard(
                context,
                popularFoodList[index]['imagePath'],
                popularFoodList[index]['name'],
                popularFoodList[index]['weight'],
                popularFoodList[index]['star'],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularFoodCard(BuildContext context, String imagePath, String name,
      String weight, String star) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                //instânciar a variavél correspondente.
                builder: (context) => FoodDetail(imagePath, name)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 25, right: 20, left: 20, bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.lightGray, blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 25),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star, color: AppColors.primary, size: 20),
                        SizedBox(width: 10),
                        PrimaryText(
                          text: 'Top da Semana',
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: PrimaryText(
                      text: name,
                      fontWeight: FontWeight.w700,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: PrimaryText(
                      color: AppColors.lightGray,
                      text: weight,
                      size: 18,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          color: AppColors.primary,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.star,
                        size: 15,
                      ),
                      SizedBox(width: 8),
                      PrimaryText(
                        text: star,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(15, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGray,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Hero(
                tag: imagePath,
                child: Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width / 2.9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryCard = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 15, bottom: 20, top: 20),
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedCategoryCard == index
              ? AppColors.primary
              : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGray,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 45,
            ),
            PrimaryText(
              text: name,
              size: 20,
              fontWeight: FontWeight.w700,
            ),
            RawMaterialButton(
              onPressed: null,
              fillColor: selectedCategoryCard == index
                  ? AppColors.white
                  : AppColors.tertiary,
              shape: CircleBorder(),
              child: Icon(
                Icons.chevron_right,
                color: selectedCategoryCard == index
                    ? AppColors.secondary
                    : AppColors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
