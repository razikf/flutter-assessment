import 'package:flutter/material.dart';
import 'package:flutter_assessment/models/user_model.dart';
import 'package:flutter_assessment/repos/repositories.dart';
import 'package:flutter_assessment/screens/detail_screen.dart';
import 'package:flutter_assessment/screens/edit_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/app_blocs.dart';
import 'blocs/app_events.dart';
import 'blocs/app_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assessment',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const MyHomePage(),
      ), 
      //const MyHomePage(title: 'My Contact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final String title = "My Contact";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  var _contact;

  void _addUser() {
    setState(() {
      _contact;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is UserLoadedState){
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            e: userList[index],
                          )
                          ),
                      );
                    },
                  child: Card(
                  color: Colors.lightGreen[50],
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userList[index].avatar),
                    ),
                    title: Text(userList[index].firstName, style:  const TextStyle( color: Colors.black),),
                    subtitle: Text(userList[index].email, style:  const TextStyle( color: Colors.black45),),
                    trailing: IconButton(
                      icon: const Icon(Icons.send),
                      tooltip: "Edit",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                         builder: (context) =>  EditScreen(e: userList[index],)
                       ));
                      },
                    ),
                  ),
                  ),
                  ),
                );
              },
            );
          }

          if(state is UserErrorState){
            return const Center(child: Text("Error"),);
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        tooltip: 'Add Contact',
        child: const Icon(Icons.add),
      ),
       ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
