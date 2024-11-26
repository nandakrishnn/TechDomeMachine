import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/height_width.dart';
import 'package:techdome/widgets/custom_like_button.dart';

class MovieOverview extends StatelessWidget {
  final String? imgeUrl;
  final String? title;
  final String imdbId;
  const MovieOverview(
      {required this.imgeUrl, this.title, super.key, required this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: const Text(
          'Movie Details',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .55,
                height: MediaQuery.of(context).size.height * .4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                        errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: MediaQuery.of(context).size.width * .55,
                        height: MediaQuery.of(context).size.height * .4,
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
                    }, imgeUrl!))),
            AppConstants.kheight15,
            Align(
              alignment: Alignment.center,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: AppColors.pureWhite, fontSize: 28),
              ),
            ),
            AppConstants.kheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Image(
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/imdb-internet-movie-database5351-removebg-preview.png')),
                    Text(
                      imdbId.toString(),
                      style: const TextStyle(
                          color: AppColors.whiteColor, fontSize: 20),
                    )
                  ],
                ),
                const Column(
                  children: [
                    CustomLikeButton(
                      isFavorited: true,
                      textfav: 'Favourite',
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}