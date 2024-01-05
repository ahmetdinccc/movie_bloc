import 'package:flutter/foundation.dart';
import 'package:movie_bloc/models/models/film/film.dart';


abstract class VizyonState{
  VizyonState();
}



class VizyonInitial extends VizyonState{
  VizyonInitial();

}


class VizyonLoading extends VizyonState{
  VizyonLoading();
}



class VizyonCompleted extends VizyonState{
  final List<Film>response;
  VizyonCompleted(this.response);


  @override
  bool operator==(Object other){
    if(identical(this,other)) return true;
    return other is VizyonCompleted && listEquals(other.response,response);
  }
  @override
  int get hashCode=>response.hashCode;

}


class VizyonError extends VizyonState{
  final String message;
  VizyonError(this.message);
}




class PopulerCompleted extends VizyonState{
  final List<Film>response;
  PopulerCompleted(this.response);



  @override
  bool operator==(Object other){
    if(identical(this,other)) return true;
    return other is VizyonCompleted && listEquals(other.response,response);
  }
  @override
  int get hashCode=>response.hashCode;

}




