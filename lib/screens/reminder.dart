// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, recursive_getters, sized_box_for_whitespace
import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addMedicine");
        },
        backgroundColor: Color.fromARGB(255, 16, 152, 170),
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 251, 251, 251),
        ),
      ),
      body: ListView(children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80.0),
                  bottomRight: Radius.circular(80)),
              color: Color.fromARGB(255, 16, 152, 170)),
          child: Center(
              child: Text("Reminders",
                  style: TextStyle(color: Colors.white, fontSize: 20))),
        ),
        Container(
          height: 800,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return // Container();
                    Padding(
                  padding: const EdgeInsets.fromLTRB(15, 80, 15, 0),
                  child: Container(
                      height: 600,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("details");
                        },
                        child: MedCard(
                            med_name: "Doliprane",
                            med_pic: "IMAGE/piills.jpg",
                            med_interval: "Every 8 hours"),
                      )),
                );
              })),
        ),
      ]),
    );
  }
}

class MedCard extends StatefulWidget {
  const MedCard(
      {super.key,
      required this.med_name,
      required this.med_pic,
      required this.med_interval});
  final String med_name;
  final String med_pic;
  final String med_interval;
  @override
  State<MedCard> createState() => _MedCardState();
}

class _MedCardState extends State<MedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 246, 243, 243),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Image.asset(
              "IMAGE/piills.jpg",
              width: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Doliprane",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              "Every 5 hours",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
