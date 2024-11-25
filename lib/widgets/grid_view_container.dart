import 'package:flutter/material.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/height_width.dart';

class MoviesGridContainer extends StatelessWidget {
  const MoviesGridContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 200,
            width: 150,
            child: Image.asset(
              'assets/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_SX300.jpg',
              fit: BoxFit.cover, 
            ),
          ),
        ),
        AppConstants.kheight10,
        const Text(
          'Inside Out',
          style: TextStyle(
              color: AppColors.pureWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
