import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:techdome/constants/api.dart';
import 'package:techdome/models/data_model.dart';
import 'package:techdome/services/status_codes.dart';
import 'package:http/http.dart'as http;

 class ApiServices {
  final ApiEndPoints _apiEnds = ApiEndPoints();
  Future<List<MovieDetials>> getMovieData() async {
    try {
      final response = await http.get(Uri.parse(_apiEnds.url));
      if (response.statusCode == 200) {
        print('Response Body: ${response.body}'); 
  final List<dynamic> data = jsonDecode(response.body);
          return data
              .map((json) => MovieDetials.fromJson(json))
              .toList()
              .cast<MovieDetials>();
      }else{
         throw Exception(StatusCodes.getMessage(response.statusCode));
      }
  }catch(e){
        debugPrint('Error printing the images $e');
      return [];
  }
}
}
