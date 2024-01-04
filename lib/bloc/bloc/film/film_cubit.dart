import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:movie_bloc/models/models/film/film.dart';
import 'package:movie_bloc/repository/repository/film/film_repository.dart';

import 'film_state.dart';


class vizyonCubit extends Cubit<vizyonState> {
  final VizyonRepository _vizyonRepository;

  vizyonCubit(this._vizyonRepository) : super(vizyonInitial());

   Future<void> getVizyon() async {
   
    try {
      emit(vizyonLoading());
      final response = await _vizyonRepository.getVizyon();
      emit(vizyonCompleted(response));
    } on NetworkError catch (_) {
      emit(vizyonError("hops internet bağlantisi Koptu"));
    }
  }


  Future<void> getPopuler() async {
   
    try {
      emit(vizyonLoading());
      final response = await _vizyonRepository.getPopuler();
      emit(populerCompleted(response));
    } on NetworkError catch (e) {
      emit(vizyonError("hops internet bağlantisi Koptu"));
    }
  }
Future<void> searchFilm(String name) async {
  try {
    emit(vizyonLoading());
    
    final vizyonResponse = await _vizyonRepository.searchFilm(name);
    final populerResponse = await _vizyonRepository.searchFilm(name);

    // Burada vizyonResponse ve populerResponse'ı birleştirebilirsiniz
    final List<Film> combinedResponse = [...vizyonResponse, ...populerResponse];

    emit(vizyonCompleted(combinedResponse));
  } on NetworkError catch (e) {
    if (e.statusCode == 404) {
      emit(vizyonError("Yeni mesaj"));
    } else {
      emit(vizyonError("ARADIĞINIZ FİLM BULUNAMAMIŞTIR"));
    }
  }
}












}