import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:techdome/models/data_model.dart';
import 'package:techdome/models/hive_model.dart';
import 'package:techdome/services/hive_functions.dart';

part 'add_movie_fav_event.dart';
part 'add_movie_fav_state.dart';

class AddMovieFavBloc extends Bloc<AddMovieFavEvent, AddMovieFavState> {
  AddMovieFavBloc() : super(AddMovieFavInitial()) {
    on<AddData>(_onAddData);
    on<LoadLocalData>(_onLoadLocalFavData);
    on<DeleteData>(_onDeleteFavData);
  }
  void _onAddData(AddData event, Emitter<AddMovieFavState> emit) async {
    try {
      final data = MovieDataFav(
          id: event.data.id,
          orginalWebUrl: event.data.orginalUrlWeb,
          movieTitle: event.data.title,
          movieImageUrl: event.data.posterURL,
          movieImdbId: event.data.imdbId);
      await addData(data, event.data.id);
      List<MovieDataFav> updatedData = await getAllLocalData();
      emit(LocalStockDataLoading());
      emit(LocalFavLoaded(updatedData));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _onLoadLocalFavData(
      LoadLocalData event, Emitter<AddMovieFavState> emit) async {
    try {
      emit(LocalStockDataLoading());
      List<MovieDataFav> data = await getAllLocalData();
      emit(LocalFavLoaded(data));
    } catch (e) {
      emit(LocalFavLoadedFailure());
    }
  }

  void _onDeleteFavData(
      DeleteData event, Emitter<AddMovieFavState> emit) async {
    try {
      await deleteData(event.id);

      List<MovieDataFav> updatedData = await getAllLocalData();

      emit(LocalStockDataLoading());

      emit(LocalFavLoaded(updatedData));
    } catch (e) {
      debugPrint(e.toString());
      emit(LocalFavLoadedFailure());
    }
  }
}
