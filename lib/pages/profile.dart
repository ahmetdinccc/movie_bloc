import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return MaterialApp(

      debugShowCheckedModeBanner: false,
home: Scaffold(
backgroundColor: const Color.fromARGB(255, 255, 0, 0),
body: SingleChildScrollView(
  child: Column(
    children: <Widget>[
      SizedBox(height: size.height,
      child: Stack(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 200),
          height: 700,
          decoration: const BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
          ),

child: const Padding(padding: EdgeInsets.only(left: 10,top: 100),
child: Center(child: Column(
  children: <Widget>[
    Text("Ahmet Talha Dinç",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
  ],
)),
),
        
        ),
        Padding(padding: const EdgeInsets.only(top: 90,left: 100),
        child:ClipOval(child:  Expanded(child: Image.network("https://media.licdn.com/dms/image/D4D03AQHYial4hJsbYQ/profile-displayphoto-shrink_200_200/0/1700325137144?e=1709769600&v=beta&t=6Xaes5yQZH8eyS87LFsnwRqNQA6MHZxOj2944UNUq4I")),)
        
        
        )
      ],),
      
      )
    ],
  ),
),
),

    );

  }
}