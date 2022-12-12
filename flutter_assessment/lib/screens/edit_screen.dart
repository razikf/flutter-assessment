import 'package:flutter/material.dart';
import 'package:flutter_assessment/models/user_model.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key, required this.e}) : super(key: key);
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(e.avatar),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                    scrollPadding: const EdgeInsets.all(20.0),
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        gapPadding: 4.0
                      ),
                    ),
                    initialValue: e.firstName,
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        gapPadding: 4.0
                      ),
                    ),
                    initialValue: e.lastName,
                  ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        gapPadding: 4.0
                      ),
                    ),
                    initialValue: e.email,
                  ),
              ),


              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Done'),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder()
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}