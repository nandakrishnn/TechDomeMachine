// ignore_for_file: must_be_immutable

part of 'fetch_movie_data_bloc.dart';

sealed class FetchMovieDataState extends Equatable {
  const FetchMovieDataState();
  
  @override
  List<Object> get props => [];
}

final class FetchMovieDataInitial extends FetchMovieDataState {}
final class FetchMovieDataLoading extends FetchMovieDataState {}
final class FetchMovieDataLoaded extends FetchMovieDataState {
  List<MovieDetials>data;
    @override
  List<Object> get props => [data];
  FetchMovieDataLoaded(this.data);
}
final class FetchMovieDataFailure extends FetchMovieDataState {
  final String errorMsg;
      @override
  List<Object> get props => [errorMsg];
  const FetchMovieDataFailure(this.errorMsg);
}
