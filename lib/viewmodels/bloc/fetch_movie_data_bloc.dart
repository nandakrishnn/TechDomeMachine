import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techdome/models/data_model.dart';
import 'package:techdome/services/api_helper.dart';

part 'fetch_movie_data_event.dart';
part 'fetch_movie_data_state.dart';

class FetchMovieDataBloc extends Bloc<FetchMovieDataEvent, FetchMovieDataState> {
  final ApiServices services;
  FetchMovieDataBloc(this.services) : super(FetchMovieDataInitial()) {
  on<FetchMovieData>(_fetchMovieData);
  on<FetchedMovieData>(_fetchedMovieData);
  }
  void _fetchMovieData(FetchMovieData event,Emitter<FetchMovieDataState>emit)async{
try {
  emit(FetchMovieDataLoading());
  List<MovieDetials>data=await services.getMovieData();
  add(FetchedMovieData(data));
} catch (e) {
    String errorMessage = "An error occurred. Please check your internet connection.";
    if (e is SocketException) {
      errorMessage = "No internet connection.";
    }
      emit(FetchMovieDataFailure(errorMessage));
}
  }
  void _fetchedMovieData(FetchedMovieData event,Emitter<FetchMovieDataState>emit)async{
try {
  emit(FetchMovieDataLoaded(event.data));
} catch (e) {
  emit(FetchMovieDataFailure(e.toString()));
}
  }
}
