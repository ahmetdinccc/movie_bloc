import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/bloc/film/film_cubit.dart';
import 'package:movie_bloc/bloc/bloc/film/film_state.dart';
import 'package:movie_bloc/models/models/film/film.dart';
import 'package:movie_bloc/widget/film_widget.dart';
import 'package:movie_bloc/pages/movie_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
int currentPage=0;


  final TextEditingController _searchController = TextEditingController();
  final List<Film> vizyonList = [];
  final List<Film> populerList = [];

  @override
  void initState() {
    super.initState();
    context.read<VizyonCubit>().getVizyon();
    context.read<VizyonCubit>().getPopuler();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 38.5)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Netflix",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.only(right: 10, left: 10, top: 20),
                padding:
                    const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    context.read<VizyonCubit>().searchFilm(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Ara",
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        context.read<VizyonCubit>().getPopuler();
                        context.read<VizyonCubit>().getVizyon();
                      },
                      icon: const Icon(Icons.delete_forever),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "Vizyondaki Filmler",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, top: 5),
                    child: Text(
                      "İncele",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  )
                ],
              ),
              BlocConsumer<VizyonCubit, VizyonState>(
                listener: (context, state) {
                  if (state is VizyonError) {}
                },
                builder: (context, state) {
                  if (state is VizyonInitial) {
                    return buildCenterLoading();
                  } else if (state is VizyonLoading) {
                    return buildCenterLoading();
                  } else if (state is VizyonCompleted) {
                    vizyonList.clear();
                    vizyonList.addAll(state.response);

                    return buildListViewFilm();
                  } else if (state is PopulerCompleted) {
                    populerList.clear();
                    populerList.addAll(state.response);

                    return buildListViewFilm();
                  } else if (state is VizyonError) {
                    return buildError(state);
                  } else {
                    return buildError(null);
                  }
                },
              ),
            ],
          ),
        ),
  
      
      ),
    );
  }

  Text buildError(VizyonError? state) {
    return Text(state?.message ?? "bir hata oluştu");
  }

  Widget buildListViewFilm() {
    return Column(
      children: [
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieInfo(
                        name: vizyonList[index].name ?? '',
                        avatar: vizyonList[index].avatar,
                        contents: vizyonList[index].contents ?? '', trailer: populerList[index].trailer??'',
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: 150,
                  child: Filmwidget(
                    name: vizyonList[index].name ?? '',
                    avatar: vizyonList[index].avatar,
                    contents: vizyonList[index].contents ?? '',
                    onTap: () {},
                  ),
                ),
              );
            },
            itemCount: vizyonList.length,
          ),
        ),
        //POPÜLER FİLMLER
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  'Popüler Filmler',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, top: 5),
                child: Text(
                  "İncele",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieInfo(
                        name: populerList[index].name ?? '',
                        avatar: populerList[index].avatar,
                        contents: populerList[index].contents ?? '', trailer: populerList[index].trailer??'',
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: 150,
                  child: Filmwidget(
                    name: populerList[index].name ?? '',
                    avatar: populerList[index].avatar,
                    contents: populerList[index].contents ?? '',
                    onTap: () {},
                  ),
                ),
              );
            },
            itemCount: populerList.length,
          ),
        ),
      ],
    );
  }

  Center buildCenterLoading() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}
