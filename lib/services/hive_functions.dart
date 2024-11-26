import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:techdome/models/hive_model.dart';

Future<void> addData(MovieDataFav value,int id) async {
  try {
    final allDB = await Hive.openBox<MovieDataFav>('streamify_db');
    final int id = await allDB.add(value);
    value.id = id;
    await allDB.put(id, value);
    debugPrint(value.movieImageUrl);
    await allDB.close();
  } catch (e) {
    debugPrint("Error adding data: $e");
  }
}

Future<List<MovieDataFav>> getAllLocalData() async {
  try {
    final allDB = await Hive.openBox<MovieDataFav>('streamify_db');
    final dataList = List<MovieDataFav>.from(allDB.values);
    return dataList;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}

Future<bool> isAlreadyFavourited(String imdbId, String movieTitle) async {
  try {
    final allDB = await Hive.openBox<MovieDataFav>('streamify_db');

    final allMovies = List<MovieDataFav>.from(allDB.values);

    for (var movie in allMovies) {
      if (movie.movieImdbId == imdbId && movie.movieTitle == movieTitle) {
        return true;
      }
    }
    return false;
  } catch (e) {
    debugPrint("Error checking if movie is favorited: $e");
    return false;
  }
}
Future<void> deleteData(int id) async {
  try {
    final allDB = await Hive.openBox<MovieDataFav>('streamify_db');
    allDB.delete(id);

  } catch (e) {
    debugPrint(e.toString());
  }
}

