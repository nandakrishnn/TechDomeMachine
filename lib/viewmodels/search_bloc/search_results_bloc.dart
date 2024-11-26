import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:techdome/models/data_model.dart';

part 'search_results_event.dart';
part 'search_results_state.dart';

class SearchResultsBloc extends Bloc<SearchResultsEvent, SearchResultsState> {

  SearchResultsBloc() : super(GetServerDataInitial()) {
     on<LoadServerData>(_onLoadServerData);
  }
  Future<void> _onLoadServerData(LoadServerData event, Emitter<SearchResultsState> emit) async {
    try {
    
      emit(GetServerDataLoading());

  
      await Future.delayed(const Duration(milliseconds: 600));

    
      final List<MovieDetials> data = await fetchMovies(event.query);

      if (data.isNotEmpty) {
        emit(GetServerDataLoaded(data));
      } else {
        emit(GetServerDataFailed('No data found for ${event.query}'));
      }
    } catch (e) {
      emit(GetServerDataFailed(e.toString()));
    }
  }
}

Future<List<MovieDetials>> fetchMovies(String searchKey) async {
  final url = Uri.parse('https://api.sampleapis.com/movies/animation');
  debugPrint('Fetching movies from: $url');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      // Filter movies by title
      final filteredMovies = data.where((movie) {
        final title = movie['title']?.toString().toLowerCase() ?? '';
        return title.contains(searchKey.toLowerCase());
      }).toList();

      return filteredMovies
          .map<MovieDetials>((json) => MovieDetials.fromJson(json))
          .toList();
    } else {
      debugPrint('Request failed with status: ${response.statusCode}');
      return [];
    }
  } catch (err) {
    debugPrint('Error: $err');
    return [];
  }
}


