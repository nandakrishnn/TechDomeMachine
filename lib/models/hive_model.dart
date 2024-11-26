import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'hive_model.g.dart';
@HiveType(typeId: 0)
class MovieDataFav {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? movieTitle;
  @HiveField(2)
  String? movieImageUrl;
    @HiveField(3)
  String? movieImdbId;
      @HiveField(4)
  String? orginalWebUrl;
  

  MovieDataFav({
    this.id,
    @required this.movieTitle,
    @required this.movieImageUrl,
        @required this.orginalWebUrl,
        @required this.movieImdbId,
  });
}
