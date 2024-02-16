// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'person $index',
            style: TextStyle(fontSize: 19),
          ),
          subtitle: Text('message recieved $index'),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/icon-5359553_1280.webp'),
          ),
          trailing: Icon(Icons.add_task),
        ),
        separatorBuilder: (context, index) => Divider(thickness: 5),
        itemCount: 15,
      )),
    );
  }
}
