import 'package:flutter/material.dart';
import 'package:Daneshjooyar/screens/WelcomeScreen.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: SafeArea(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'اطلاعات کاربری',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Baloo',
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UserInfoField(
                        label: 'نام',
                        initialValue: 'shamim',
                        editable: true,
                      ),
                      UserInfoField(
                        label: 'نام خانوادگی',
                        initialValue: 'nasehi',
                        editable: true,
                      ),
                      UserInfoField(
                        label: 'شماره دانشجویی',
                        initialValue: '402243124',
                        editable: true,
                      ),
                      UserInfoField(
                        label: 'نام کاربری',
                        initialValue: 'shamimnasehi',
                        editable: true,
                      ),
                      UserInfoField(
                        label: 'رمز عبور',
                        initialValue: '********',
                        editable: true,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle delete account logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: Text(
                'پاک کردن حساب',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade900,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal.shade100,
        currentIndex: 1,
        onTap: (int newIndex) {
          if (newIndex == 0) {
            Navigator.pop(context);
          }
        },
        items: [
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
    );
  }
}

class UserInfoField extends StatefulWidget {
  final String label;
  final String initialValue;
  final bool editable;
  final bool obscureText;

  UserInfoField({
    required this.label,
    required this.initialValue,
    this.editable = false,
    this.obscureText = false,
  });

  @override
  _UserInfoFieldState createState() => _UserInfoFieldState();
}

class _UserInfoFieldState extends State<UserInfoField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: widget.editable ? buildEditableField() : buildReadOnlyField(),
    );
  }

  Widget buildEditableField() {
    return TextField(
      controller: _controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildReadOnlyField() {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
