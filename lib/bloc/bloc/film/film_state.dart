import 'package:flutter/foundation.dart';
import 'package:movie_bloc/models/models/film/film.dart';

abstract class vizyonState{
  vizyonState();
}


class vizyonInitial extends vizyonState{
  vizyonInitial();

}


class vizyonLoading extends vizyonState{
  vizyonLoading();
}



class vizyonCompleted extends vizyonState{
  final List<Film>response;
  vizyonCompleted(this.response);


  @override
  bool operator==(Object o){
    if(identical(this,o)) return true;
    return o is vizyonCompleted && listEquals(o.response,response);
  }
  @override
  int get hashCode=>response.hashCode;

}

class vizyonError extends vizyonState{
  final String message;
  vizyonError(this.message);
}



class populerCompleted extends vizyonState{
  final List<Film>response;
  populerCompleted(this.response);


  @override
  bool operator==(Object o){
    if(identical(this,o)) return true;
    return o is vizyonCompleted && listEquals(o.response,response);
  }
  @override
  int get hashCode=>response.hashCode;

}




