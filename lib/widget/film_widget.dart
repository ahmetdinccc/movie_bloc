import 'package:flutter/material.dart';



class Filmwidget extends StatefulWidget {
  const Filmwidget({super.key,

  required this.name,
  required this.avatar,
  required this.contents,
  
  required this.onTap,
   
}
  
  );


  final String name;
  final String avatar;
  final String contents;
  
  final Function() onTap;


  @override
  State<Filmwidget> createState() => _FilmwidgetState();
}

class _FilmwidgetState extends State<Filmwidget> {
  @override
  Widget build(BuildContext context) {
    
    return Card(
  color: const Color.fromARGB(255, 255, 255, 255),
  child: SizedBox(
    width: 150, 
    
    child: Column(
      
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.network(
          
            widget.avatar,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}
