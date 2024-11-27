import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:techdome/models/hive_model.dart';
import 'package:techdome/services/api_helper.dart';
import 'package:techdome/viewmodels/add_fav_bloc/add_movie_fav_bloc.dart';
import 'package:techdome/viewmodels/search_bloc/search_results_bloc.dart';
import 'package:techdome/viewmodels/fetch_movie_bloc/fetch_movie_data_bloc.dart';
import 'package:techdome/widgets/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<MovieDataFav>(MovieDataFavAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchMovieDataBloc(ApiServices()),
        ),
        BlocProvider(
          create: (context) => AddMovieFavBloc()..add(LoadLocalData()),
   
        ),
        BlocProvider(
          create: (context) => SearchResultsBloc(),

        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
