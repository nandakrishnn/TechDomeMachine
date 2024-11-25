import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techdome/bottom_nav.dart';
import 'package:techdome/services/api_helper.dart';
import 'package:techdome/viewmodels/bloc/fetch_movie_data_bloc.dart';

void main() {
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

        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
        debugShowCheckedModeBanner: false,
        home: const BottomNavigation(),
      ),
    );
  }
}
