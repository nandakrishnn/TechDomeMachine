import 'package:flutter/material.dart';
import 'package:techdome/constants/colors.dart';

class FavouritesViewPage extends StatelessWidget {
  const FavouritesViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(title: Text('Favourites',style: TextStyle(color: AppColors.whiteColor),),
      backgroundColor:  AppColors.bgColor,
      centerTitle: true,
      ),
    );
  }
}