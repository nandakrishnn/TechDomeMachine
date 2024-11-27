import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techdome/constants/colors.dart';

class ShimmerHomeView extends StatelessWidget {
  const ShimmerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade900,
            highlightColor: Colors.grey.shade800,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.53,
              width: double.infinity,
              color: Colors.grey.shade900,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                mainAxisExtent: 240,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return const ShimmerGridItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerGridItem extends StatelessWidget {
  const ShimmerGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade800,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
