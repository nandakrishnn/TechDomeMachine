import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


Future<String> saveImageToLocalStorage(String imageUrl, String imdbId) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$imdbId.jpg';

    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {

      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath; 
    } else {
      throw Exception('Failed to download image');
    }
  } catch (e) {
    throw Exception('Error saving image locally: $e');
  }
}

Widget buildImageUnavailable() {
  return Container(
    color: Colors.grey.shade800,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.broken_image, color: Colors.grey, size: 40),
        
      ],
    ),
  );
}


