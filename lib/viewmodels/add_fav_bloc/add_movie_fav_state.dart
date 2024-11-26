part of 'add_movie_fav_bloc.dart';

sealed class AddMovieFavState extends Equatable {
  const AddMovieFavState();
  
  @override
  List<Object> get props => [];
}

final class AddMovieFavInitial extends AddMovieFavState {}
final class LocalStockDataLoading extends AddMovieFavState {}

final class LocalFavLoaded extends AddMovieFavState {
  final List<MovieDataFav> data;
 const LocalFavLoaded(this.data);
}

final class LocalFavLoadedFailure extends AddMovieFavState {}
