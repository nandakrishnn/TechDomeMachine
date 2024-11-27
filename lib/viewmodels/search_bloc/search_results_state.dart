part of 'search_results_bloc.dart';

sealed class SearchResultsState extends Equatable {
  const SearchResultsState();
  
  @override
  List<Object> get props => [];
}


final class GetServerDataInitial extends SearchResultsState {}

final class GetServerDataLoading extends SearchResultsState {}

final class GetServerDataLoaded extends SearchResultsState {
   final List<MovieDetials> data;
  const GetServerDataLoaded(this.data);
}

final class GetServerDataFailed extends SearchResultsState {
  final String errorMsg;

   const GetServerDataFailed(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
class DropdownVisibilityState extends SearchResultsState {
  final bool isVisible;
  const DropdownVisibilityState(this.isVisible);
}