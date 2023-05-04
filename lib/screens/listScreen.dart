import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_demo/screens/bottom_bar.dart';
import 'package:notes_demo/screens/todoScreen.dart';

import '../constants.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
        child: Container(
          margin: bmargintop,
          padding: bpadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Text('Notes', style: bheadings),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar(),));
                  },
                  child: Image.asset('images/backicon.png'),
                ),

              SizedBox(height: 24,),

              InkWell(
                onTap: () {},
                child: Image.asset('images/search.png'),
              ),

              SizedBox(height: 32,),

              Text('To Do', style: bheadings,)

            ],
          )
        ),
      )
          


    );
  }
}