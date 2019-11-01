//junto com a classe api_service, foi criada uma função para verificar os users que estão no endpoint e validaar em uma tela de login

import 'package:bookhubunip/api_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Urls {
  static const BASE_API_URL = "https://jsonplaceholder.typicode.com";
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Post de dados",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  TextEditingController _usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Username",
            ),
            controller: _usernameController,
          ),
          Container(
            height: 20,
          ),
          _isLoading
              ? CircularProgressIndicator()
              : SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      final users = await ApiService.getUserList();
                      setState(() {
                        _isLoading = false;
                      });
                      if (users == null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text("Check your internet connection"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                        return;
                      } else {
                        final userWithUsernameExists = users.any(
                            (u) => u['username'] == _usernameController.text);
                        if (userWithUsernameExists) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Post()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Incorrect username"),
                                  content:
                                      Text("Try with a different username"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      }
                    },
                  )),
        ]),
      ),
    );
  }
}

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
