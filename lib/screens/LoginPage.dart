import 'dart:io';
import 'package:Daneshjooyar/screens/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String response = '';

  Future<String> login(String username, String password) async {
    Socket socket = await Socket.connect("192.168.1.109", 8080);
    socket.write('login~${username}~${password}\u0000');
    socket.flush();

    await socket.listen((socket) {
      setState(() {
        response = String.fromCharCodes(socket);
      });
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.teal.shade900,
                Colors.teal.shade700,
                Colors.teal.shade200,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "وارد شوید",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Baloo',
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "اطلاعات خود را وارد کنید.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Baloo',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 51, 51, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  hintText: "نام کاربری",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Baloo',
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "رمز عبور",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Baloo',
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "رمز خود را فراموش کرده اید؟",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontFamily: 'Baloo',
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Material(
                        color: Colors.teal.shade900,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () async {
                            String username = _usernameController.text;
                            String password = _passwordController.text;
                            // String result = await login(username, password);
                            // if (result == "found") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(studentId: _usernameController.text,),
                                ),
                              );
                            // }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            child: Text(
                              "ورود",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Baloo',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
