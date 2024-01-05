import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/models/models/film/film.dart';
import 'package:movie_bloc/repository/repository/film/film_repository.dart';

import 'film_state.dart';

class VizyonCubit extends Cubit<VizyonState> {
  
  final VizyonRepository _vizyonRepository;

  VizyonCubit(this._vizyonRepository) : super(VizyonInitial());

   Future<void> getVizyon() async {
   
    try {
      emit(VizyonLoading());
      final response = await _vizyonRepository.getVizyon();
      emit(VizyonCompleted(response));
    } on NetworkError catch (_) {
      emit(VizyonError("hops internet bağlantisi Koptu"));
    }
  }


  Future<void> getPopuler() async {
   
    try {
      emit(VizyonLoading());
      final response = await _vizyonRepository.getPopuler();
      emit(PopulerCompleted(response));
    } on NetworkError catch (_) {
      emit(VizyonError("hops internet bağlantisi Koptu"));
    }
  }
Future<void> searchFilm(String name) async {
  try {
    emit(VizyonLoading());
    
    final vizyonResponse = await _vizyonRepository.searchFilm(name);
    final populerResponse = await _vizyonRepository.searchFilm(name);

    final List<Film> combinedResponse = [...vizyonResponse, ...populerResponse];

    emit(VizyonCompleted(combinedResponse));
  } on NetworkError catch (e) {
    if (int.tryParse(e.statusCode)==404) {
      emit(VizyonError("Yeni mesaj"));
    } else {
      emit(VizyonError("ARADIĞINIZ FİLM BULUNAMAMIŞTIR"));
    }
  }
}












}