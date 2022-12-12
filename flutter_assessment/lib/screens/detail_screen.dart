import 'package:flutter/material.dart';
import 'package:flutter_assessment/models/user_model.dart';

import 'edit_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.e}) : super(key: key);
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: <Widget>[
          IconButton(
             icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => const EditScreen(e: userList[index],)
                      // ));
                    },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ),
              Text(
                e.firstName + " " + e.lastName,
              ),
              Icon(
                Icons.email,
                color: Colors.lightGreen,
                size: 60.0,),
              Text(e.email),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Send Email'),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}