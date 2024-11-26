
import 'package:flutter/material.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/height_width.dart';
import 'package:techdome/widgets/custom_textformfeild.dart';

class CustomAppBar extends StatelessWidget {
 final  coverImageUrl;
  const CustomAppBar({
    this.coverImageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 440,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          color: Colors.black.withOpacity(0),
          child: Container(
            decoration:   BoxDecoration(
              color: Colors.transparent,
                image: DecorationImage(
                    image: NetworkImage(
                      coverImageUrl),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppConstants.kheight10,
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), 
                          blurRadius: 8, 
                          spreadRadius: 2, 
                          offset: const Offset(0, 4), 
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/5fdfa98001a201aed81d5119d0456915-removebg-preview.png',
                              height: 70,
                              width: 70,
                            ),
                           const Text(
                              'Streamify',
                              style: TextStyle(
                                  color: AppColors.pureWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.cast,
                          color: Colors.white,
                          size: 32,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomSearchField(
                    hintText: 'Search ',
                    fillColor: Colors.white,
                    prefixIcon: Icons.search,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
