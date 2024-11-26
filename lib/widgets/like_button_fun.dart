
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techdome/constants/functions.dart';
import 'package:techdome/models/data_model.dart';
import 'package:techdome/services/hive_functions.dart';
import 'package:techdome/viewmodels/add_fav_bloc/add_movie_fav_bloc.dart';
import 'package:techdome/widgets/custom_like_button.dart';
import 'package:techdome/widgets/custom_snack.dart';

class LikeButtonFunctionsOverview extends StatelessWidget {
  const LikeButtonFunctionsOverview({
    super.key,
    required this.imdbId,
    required this.title,
    required this.id,
    required this.imgeUrl,
    required this.imageUrlofWeb,
  });

  final String? imdbId;
  final String? title;
  final int? id;
  final String? imgeUrl;
  final String imageUrlofWeb;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<bool>(
          future: isAlreadyFavourited(imdbId!, title!),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
    
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
    
            bool isFavorited = snapshot.data ?? false;
    
            return CustomLikeButton(
              isFavorited: isFavorited,
              textfav: isFavorited
                  ? 'Remove from Favorites'
                  : 'Add to Favorites',
              onLikeButtonTapped: (isLiked) async {
                try {
                  if (isFavorited) {
                    context
                        .read<AddMovieFavBloc>()
                        .add(DeleteData(id!));
                    Navigator.of(context).pop();
                  } else {
                    // Add to favorites
                    ScaffoldMessenger.of(context)
                        .showSnackBar(customSnack(
                            'Adding to Fav',
                            'Just a moment...',
                            const Icon(
                              Icons.pending,
                              color: Colors.blue,
                              size: 28,
                            ),
                            Colors.green));
    
                    final localImagePath =
                        await saveImageToLocalStorage(
                      imgeUrl!,
                      imdbId!,
                    );
    
                    final movieData = MovieDetials(
                        id: id!,
                        title: title!,
                        orginalUrlWeb: imageUrlofWeb,
                        posterURL: localImagePath,
                        imdbId: imdbId!);
    
                    context
                        .read<AddMovieFavBloc>()
                        .add(AddData(movieData));
    
                    ScaffoldMessenger.of(context)
                        .showSnackBar(customSnack(
                            'Added to fav',
                            'Completed',
                            const Icon(
                              Icons.done,
                              color: Colors.red,
                              size: 28,
                            ),
                            Colors.green));
                  }
    
                  return true;
                } catch (error) {
                  print('Error saving favorite: $error');
                  return false;
                }
              },
            );
          },
        ),
      ],
    );
  }
}
