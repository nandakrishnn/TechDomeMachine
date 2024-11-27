import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techdome/animations/route_animations.dart';
import 'package:techdome/constants/colors.dart';
import 'package:techdome/constants/functions.dart';
import 'package:techdome/view/movie_overview.dart';
import 'package:techdome/viewmodels/add_fav_bloc/add_movie_fav_bloc.dart';

class FavouritesViewPage extends StatelessWidget {
  const FavouritesViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: const Text(
            'Favourites',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
        ),
        body: BlocConsumer<AddMovieFavBloc, AddMovieFavState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LocalFavLoaded) {
                final data = state.data;
                if (data.isEmpty) {
                  return const Center(
                      child:  Text(
                    'No favourites :)',
                    style:
                        TextStyle(color: AppColors.whiteColor, fontSize: 20),
                  ));
                }
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(createRoute(
                                MovieOverview(
                                    imgeUrl: data[index].orginalWebUrl,
                                    id: data[index].id,
                                    title: data[index].movieTitle,
                                    imdbId:
                                        data[index].movieImdbId.toString())));
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 150,
                              width: 90,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.file(
                                File(data[index].movieImageUrl!),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return buildImageUnavailable();
                                },
                              ),
                            ),
                          ),
                          title: Text(
                            overflow: TextOverflow.ellipsis,
                            data[index].movieTitle!,
                            style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing:  IconButton(
                            onPressed: (){
                                  context
                                    .read<AddMovieFavBloc>()
                                    .add(DeleteData(data[index].id!));
                    
                            },
                          icon:  const Icon(Icons.favorite),
                            color: Colors.redAccent,
                          ),
                        ),
                      );
                    });
              }
              return Container();
            }));
  }
}
