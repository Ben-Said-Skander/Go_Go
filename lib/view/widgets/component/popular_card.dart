import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  const PopularCard(
      {super.key,
      required this.blogTitle,
      required this.blogPicture,
      required this.route});
  final String blogTitle;
  final String blogPicture;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Color.fromARGB(255, 207, 207, 207),
              )
            ]),
        width: 600,
        height: 120,
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 0),
                child: Image.asset(
                  blogPicture,
                  width: 120,
                  height: 100,
                ),
              ),
            ),
            Container(
              width: 200,
              child: Text(
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                blogTitle,
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
