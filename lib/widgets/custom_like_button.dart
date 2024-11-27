import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/height_width.dart';

class CustomLikeButton extends StatelessWidget {
  final bool isFavorited;
  final String? textfav;
  final Future<bool> Function(bool)? onLikeButtonTapped;

  const CustomLikeButton({
    super.key,
    this.textfav,
    required this.isFavorited,
     this.onLikeButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.lighestGreyColor, 
            shape: BoxShape.circle, 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(13), 
          child: LikeButton(
            isLiked: isFavorited,
            circleColor: const CircleColor(
              start: Color(0xff00ddff),
              end: Color(0xff0099cc),
            ),
            bubblesColor: const BubblesColor(
              dotPrimaryColor: Colors.pink,
              dotSecondaryColor: Colors.white,
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.favorite,
                color: isLiked ? Colors.red : AppColors.whiteColor,
                size: 27, 
              );
            },
            onTap: onLikeButtonTapped,
          ),
        ),
     AppConstants.kheight10,
           Text(
            textfav??'',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
      ],
    );
  }
}
