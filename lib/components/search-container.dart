import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height / 15,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              color: Colors.black.withOpacity(.5),
              blurRadius: 20,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(children: [
          // SvgPicture.asset("assets/icons/search-icon.svg"),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search movie title/genre",
              ),
            ),
          )
        ]),
      ),
    );
  }
}

// Text(
//   "Search Movie title/genre",
//   style: TextStyle(
//       color: Colors.black.withOpacity(.5),
//       fontSize: 20,
//       fontWeight: FontWeight.bold),
// ),
