import 'package:flutter/material.dart';
import 'package:Daneshjooyar/screens/News.dart';
import 'package:Daneshjooyar/screens/YourClasses.dart';
import 'package:Daneshjooyar/screens/YourHomework.dart';
import 'package:Daneshjooyar/screens/TodoList.dart';
import '../models/Todo.dart';
import 'UserProfile.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String username;
  final String studentId;

  HomePage(
      {required this.name, required this.username, required this.studentId});

  @override
  _HomePageTestState createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.teal.shade900,
          title: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              "کاربر ${widget.name} خوش آمدید ",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontFamily: 'Baloo'),
            ),
          ),
        ),
        body: Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'تعداد تمرین ها: 3',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Baloo',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      Text(
                        'تعداد تمرین های نوشته نشده: 2',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Baloo',
                          color: Colors.teal.shade900,
                        ),
                      ),
                      Text(
                        'تعداد آزمون های پیش رو: 1',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Baloo',
                          color: Colors.teal.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoList(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Text(
                    'نمایش همه',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo',
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'بهترین نمره شما: 19',
                        style: TextStyle(
                          color: Colors.teal.shade100,
                          fontFamily: 'Baloo',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'بدترین نمره شما: 14',
                        style: TextStyle(
                          color: Colors.teal.shade100,
                          fontFamily: 'Baloo',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YourClasses(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal.shade100),
                            foregroundColor: MaterialStateProperty.all(Colors.teal),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Text('کلاس ها',
                            style: TextStyle(
                              fontFamily: 'Baloo',
                              fontSize: 15,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YourHomework(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal.shade100),
                            foregroundColor: MaterialStateProperty.all(Colors.teal),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Text('تمرین ها',
                              style: TextStyle(
                                fontFamily: 'Baloo',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => News(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal.shade100),
                            foregroundColor: MaterialStateProperty.all(Colors.teal),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                              'خبر ها',
                              style: TextStyle(
                                  fontFamily: 'Baloo',
                                  fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TodoList(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal.shade100),
                            foregroundColor: MaterialStateProperty.all(Colors.teal),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Text('کار ها',
                              style: TextStyle(
                                fontFamily: 'Baloo',
                                fontSize: 15,
                              ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal.shade100,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfile(),
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              label: 'صفحه اصلی',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'اطلاعات کاربری',
              icon: Icon(Icons.person),
            ),
          ],
          selectedItemColor: Colors.teal.shade900,
          unselectedItemColor: Colors.teal,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
