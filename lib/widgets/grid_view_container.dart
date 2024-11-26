import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/functions.dart';
import 'package:techdome/constants/height_width.dart';
import 'package:techdome/models/data_model.dart';
import 'package:techdome/services/hive_functions.dart';
import 'package:techdome/viewmodels/add_fav_bloc/add_movie_fav_bloc.dart';
import 'package:techdome/widgets/custom_like_button.dart';
import 'package:techdome/widgets/custom_snack.dart';

class MoviesGridContainer extends StatelessWidget {
  final String imageUrl;
  final void Function()? onTap;
  final String movieName;
  final String? imgeUrl;
  final String? title;
  final String? imdbId;
  final String imageUrlofWeb;
  final int? id;

  const MoviesGridContainer({
    required this.onTap,
        required this.imageUrlofWeb,
    super.key,
    this.imgeUrl,
    this.title,
    this.id,
    required this.imdbId,
    required this.imageUrl,
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  width: 160,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 100,
                        width: 150,
                        color: Colors.grey.shade800,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 40,
                              ),
                            ),
                            AppConstants.kheight10,
                            Text(
                              'Image Unavailable',
                              style: TextStyle(color: AppColors.pureWhite),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
             
            ],
          ),
          AppConstants.kheight10,
          Text(
            movieName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.pureWhite,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
