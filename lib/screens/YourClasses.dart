import 'package:flutter/material.dart';

class YourClasses extends StatefulWidget {
  const YourClasses({Key? key}) : super(key: key);

  @override
  State<YourClasses> createState() => _YourClassesState();
}

class _YourClassesState extends State<YourClasses> {
  // Dummy data for classes (replace with actual data)
  List<Class> classes = [
    Class(
      name: 'برنامه نویسی پیشرفته',
      teacher: 'استاد وحیدی',
      units: 3,
      uniqueCode: '001',
    ),
    Class(
      name: 'مدار های الکتریکی',
      teacher: 'استاد شکفته',
      units: 3,
      uniqueCode: '002',
    ),
    Class(
      name: 'فیزیک 2',
      teacher: 'استاد زیبایی',
      units: 3,
      uniqueCode: '003',
    ),
    Class(
      name: 'ریاضی 2',
      teacher: 'استاد خلج',
      units: 3,
      uniqueCode: '004',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text(
          'کلاس ها',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Baloo',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            color: Colors.teal.shade100,
            child: ListTile(
              title: Text(
                classes[index].name,
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'نام استاد: ${classes[index].teacher}',
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 18,
                    ),
                  ),
                  Text('تعداد واحد: ${classes[index].units}',
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 18,
                    ),),
                  Text('کد منحصر به فرد: ${classes[index].uniqueCode}',
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 18,
                    ),),
                ],
              ),
              onTap: () {
                // Add your action here when tapping on the card
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action to add new class here
          _showAddClassDialog();
        },
        child: Icon(Icons.add,
        color: Colors.white,),
        backgroundColor: Colors.teal.shade900,
      ),
    );
  }

  void _showAddClassDialog() {
    // Implement your dialog to add class using unique code here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('افزودن کلاس',
            style: TextStyle(
            fontFamily: 'Baloo',
            fontSize: 20,
          ),),
          content: TextField(
            style: TextStyle(
              fontFamily: 'Baloo',
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: 'کد منحصر به فرد را وارد کنید',
            ),
            onChanged: (value) {
              // Handle input change
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('لغو',
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontFamily: 'Baloo',
                  fontSize: 20,
                ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('افزودن',
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontFamily: 'Baloo',
                  fontSize: 20,
                ),),
              onPressed: () {
                // Handle add class action
                // You can implement the logic to add class here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Class {
  final String name;
  final String teacher;
  final int units;
  final String uniqueCode;

  Class({
    required this.name,
    required this.teacher,
    required this.units,
    required this.uniqueCode,
  });
}
