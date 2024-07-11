import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ثبت نام",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontSize: 40,
                        fontFamily: 'Baloo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "اطلاعات خود را وارد کنید.",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Baloo',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
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
                                decoration: InputDecoration(
                                  hintText: "نام",
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
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "نام خانوادگی",
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
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "شماره دانشجویی",
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
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
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
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
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
                        height: 50,
                      ),
                      Material(
                        color: Colors.teal.shade900,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  name: 'shamim',
                                  username: 'shamimnasehi',
                                  studentId: '4022222',
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            child: Text(
                              "ثبت نام",
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
