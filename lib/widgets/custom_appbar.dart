import 'package:flutter/material.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/height_width.dart';
import 'package:techdome/widgets/custom_textformfeild.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
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
            decoration: const BoxDecoration(
              color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage(
                        'assets/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_SX300.jpg'),
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
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          blurRadius: 8, // Shadow blur
                          spreadRadius: 2, // Shadow spread
                          offset: Offset(0, 4), // Shadow position
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/logo.png',
                              height: 70,
                              width: 70,
                            ),
                            Text(
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
