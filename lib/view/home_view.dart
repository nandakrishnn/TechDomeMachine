import 'package:flutter/material.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/height_width.dart';
import 'package:techdome/widgets/custom_appbar.dart';
import 'package:techdome/widgets/grid_view_container.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const CustomAppBar(),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstants.kheight5,
                const Text(
                  'All Movies',
                  style: TextStyle(color: AppColors.pureWhite, fontSize: 25),
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: 8,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          mainAxisExtent: 240,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext, index) {
                        return const MoviesGridContainer();
                      }),
                )
              ],
            ),
          )),
    );
  }
}
