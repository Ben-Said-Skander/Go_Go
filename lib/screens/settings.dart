// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'package:pfa_application_1/constants/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
              icon: Icon(Icons.arrow_back_ios)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("IMAGE/dhia.jpg"),
                  radius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  'Welcome  ,',
                  style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  'Skander',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
            child: Text(
              'FirstName',
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Fields(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              'LastName',
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Fields(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              'Email',
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Fields(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              'Password',
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Fields(),
        ],
      ),
    );
  }
}

class Fields extends StatefulWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('..................................'),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Color.fromARGB(255, 9, 32, 51),
            ))
      ],
    );
  }
}
