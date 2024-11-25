part of 'fetch_movie_data_bloc.dart';

sealed class FetchMovieDataEvent extends Equatable {
  const FetchMovieDataEvent();

  @override
  List<Object> get props => [];
}
class FetchMovieData extends FetchMovieDataEvent{

}
class FetchedMovieData extends FetchMovieDataEvent{
   final List<MovieDetials>data;
 const FetchedMovieData(this.data);
    @override
  List<Object> get props => [data];
}