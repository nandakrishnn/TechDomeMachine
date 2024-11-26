import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techdome/animations/route_animations.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/height_width.dart';
import 'package:techdome/services/api_helper.dart';
import 'package:techdome/view/movie_overview.dart';
import 'package:techdome/viewmodels/bloc/fetch_movie_data_bloc.dart';
import 'package:techdome/widgets/custom_appbar.dart';
import 'package:techdome/widgets/grid_view_container.dart';
import 'package:techdome/widgets/random_images.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocProvider(
        create: (context) =>
            FetchMovieDataBloc(ApiServices())..add(FetchMovieData()),
        child: BlocConsumer<FetchMovieDataBloc, FetchMovieDataState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is FetchMovieDataLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FetchMovieDataLoaded) {
              if (state.data.isEmpty) {
                return const Center(child: Text('No movies available'));
              }
              final data = state.data;
              final List<String> posterUrls =
                  data.map((movie) => movie.posterURL).toList();
              return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      StreamBuilder<String>(
                        stream: randomImageStream(posterUrls),
                        builder: (context, snapshot) {
                          final imageUrl = snapshot.data ?? posterUrls[0];
                          return CustomAppBar(coverImageUrl: imageUrl);
                        },
                      ),
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
                          style: TextStyle(
                              color: AppColors.pureWhite, fontSize: 22),
                        ),
                        Expanded(
                          child: GridView.builder(
                              itemCount: data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 15,
                                      mainAxisExtent: 240,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return MoviesGridContainer(
                                  onTap: () => Navigator.of(context)
                                      .push(createRoute(MovieOverview(
                                        imdbId: data[index].imdbId,
                                    imgeUrl: data[index].posterURL,
                                    title: data[index].title,
                                  ))),
                                  movieName: data[index].title,
                                  imageUrl: data[index].posterURL,
                                );
                              }),
                        )
                      ],
                    ),
                  ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
