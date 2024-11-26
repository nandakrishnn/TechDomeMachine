part of 'add_movie_fav_bloc.dart';

sealed class AddMovieFavEvent extends Equatable {
  const AddMovieFavEvent();

  @override
  List<Object> get props => [];
}
class LoadLocalData extends AddMovieFavEvent {}

class AddData extends AddMovieFavEvent {
  final MovieDetials data;
  const AddData(this.data);
}

class DeleteData extends AddMovieFavEvent {
  final int id;
 const DeleteData(this.id);
}
