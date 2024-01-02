import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/bloc/film/film_cubit.dart';
import 'package:movie_bloc/repository/repository/film/film_repository.dart';
import 'package:movie_bloc/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<vizyonCubit>(
            create: (context) => vizyonCubit(SampleVizyonRepository())
        
          ),
        ],
        child: Home(),
      ),
    );
  }
}