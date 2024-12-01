import 'dart:convert';
import 'package:flutter/services.dart';

class Repository {
  
  Future<List<String>> fetchJokes(String path) async {
    try {
      String joke = await rootBundle.loadString(path);
      return LineSplitter.split(joke).toList();
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }

}
