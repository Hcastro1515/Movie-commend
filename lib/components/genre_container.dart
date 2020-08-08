import 'package:Movie_rating_app/components/movie_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildGenreContainer extends StatelessWidget {
  final genre;
  final Size size;
  const BuildGenreContainer({
    Key key,
    @required this.size,
    @required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height / 4,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 10, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              genre,
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline1),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: MovieItemBuilder(
              genre: genre,
            ))
          ],
        ),
      ),
    );
  }
}
