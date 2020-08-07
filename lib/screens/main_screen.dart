import '../models/movie.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String movieName = "The nun";
  List<Movie> movies = List();
  var isLoading = false;

  Future<Movie> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final res =
        await http.get('http://www.omdbapi.com/?t=$movieName&apikey=321c4585');
    final jsonData = json.decode(res.body);
    print(res.body);
    var map = Map<String, dynamic>.from(jsonData);
    var response = Movie.fromJson(map);
    if (res.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      return response;
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Searcher"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text("Get data"),
            onPressed: _fetchData,
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    title: Text("${movies[index].title.toString()}"),
                    trailing: Image.network(
                      '${movies[index].poster.toString()}',
                      fit: BoxFit.cover,
                      height: 40.0,
                      width: 40.0,
                    ),
                  );
                },
              ));
  }
}
