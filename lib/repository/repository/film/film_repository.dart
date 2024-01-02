import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_bloc/models/models/film/film.dart';

abstract class VizyonRepository {
  Future<List<Film>> getVizyon();
  Future<List<Film>> searchFilm(String filmName);

  Future<List<Film>> getPopuler();
}

class SampleVizyonRepository implements VizyonRepository {
  final vizyonUrl = "https://657845bcf08799dc8044bfe2.mockapi.io/vizyon";
 final populerUrl = "https://api.npoint.io/1f05bf6caf3f84d6ae73";
  @override
  Future<List<Film>> getVizyon() async {
    
    try {
      final response = await http.get(Uri.parse(vizyonUrl));

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          return jsonData
              .map((e) => Film.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          throw NetworkError('Error', 'Unexpected data structure');
        }
      } else {
        throw NetworkError(response.statusCode.toString(), response.body);
      }
    } catch (e, stackTrace) {
      print(stackTrace.toString());
      print(e.toString());
      throw NetworkError('Error', e.toString());
    }
  }



   @override
  Future<List<Film>> getPopuler( ) async {
    try {
      final response = await http.get(Uri.parse(populerUrl));

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          return jsonData
              .map((e) => Film.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          throw NetworkError('Error', 'Unexpected data structure');
        }
      } else {
        throw NetworkError(response.statusCode.toString(), response.body);
      }
    } catch (e, stackTrace) {
      print(stackTrace.toString());
      print(e.toString());
      throw NetworkError('Error', e.toString());
    }
  }


  @override
  Future<List<Film>> searchFilm(String name) async {
    try {
      final response = await http.get(Uri.parse('$vizyonUrl?search=$name'));

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          return jsonData
              .map((e) => Film.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          throw NetworkError('Error', 'Unexpected data structure');
        }
      } else {
        throw NetworkError(response.statusCode.toString(), response.body);
      }
    } catch (e, stackTrace) {
      print(stackTrace.toString());
      print(e.toString());
      throw NetworkError('Error', e.toString());
    }
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);

  @override
  String toString() {
    return 'NetworkError: Status Code: $statusCode, Message: $message';
  }
}
