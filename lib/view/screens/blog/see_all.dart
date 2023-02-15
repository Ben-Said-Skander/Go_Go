// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            height: 150,
            decoration: BoxDecoration(color: Color.fromARGB(255, 16, 152, 170)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("See All",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )),
              ],
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
          child: Text(
            " Drug Experience ",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        Container(
          height: 560,
          padding: EdgeInsets.only(top: 10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return MedCard(
                    med_name: "Doliprane",
                    med_pic: "assets/image/sirop.jpg",
                    med_interval: "Every 8 hours");
              })),
        ),
      ]),
    );
  }
}

class MedCard extends StatelessWidget {
  const MedCard(
      {Key? key,
      required this.med_name,
      required this.med_pic,
      required this.med_interval})
      : super(key: key);
  final String med_name;
  final String med_pic;
  final String med_interval;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("details");
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                )
              ]),
          width: 200,
          height: 600,
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                med_pic,
                width: 100,
                height: 100,
              )),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  med_name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  med_interval,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ));
  }
}
