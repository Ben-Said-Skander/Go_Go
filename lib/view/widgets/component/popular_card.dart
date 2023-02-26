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
                blurRadius: 2,
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
                padding: const EdgeInsets.only(top: 8, left: 10),
                child: Image.asset(
                  blogPicture,
                  width: 150,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
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
