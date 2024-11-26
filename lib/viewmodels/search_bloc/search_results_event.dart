part of 'search_results_bloc.dart';

sealed class SearchResultsEvent extends Equatable {
  const SearchResultsEvent();

  @override
  List<Object> get props => [];
}
class LoadServerData extends SearchResultsEvent {
  final String query;

  const LoadServerData(this.query);
}
class ToggleDropdownVisibility extends SearchResultsEvent {
  final bool isVisible;
  ToggleDropdownVisibility(this.isVisible);
}