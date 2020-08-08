// import 'package:Movie_rating_app/components/movie_item_builder.dart';
import 'package:Movie_rating_app/components/genre_container.dart';
import 'package:Movie_rating_app/components/search-container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/custom_app_bar.dart';
import '../components/movie_item_builder.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff414141),
        body: SingleChildScrollView(
                  child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25,),
                  child: CustomAppBar(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: SearchContainer(size: size),
                ),
                BuildGenreContainer(size: size, genre: "Horror",),
                BuildGenreContainer(size: size, genre: "Comedy"), 
                BuildGenreContainer(size: size, genre: "Action"), 
                BuildGenreContainer(size: size, genre: "Mystery"),
                BuildGenreContainer(size: size, genre: "Romance"),
                BuildGenreContainer(size: size, genre: "Anime"),
              ],
            ),
          ),
        ));
  }
}
