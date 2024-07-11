import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // برای فرمت تاریخ

class Homework {
  String title;
  DateTime deadline;
  Duration estimatedTime;
  String description;
  bool completed;
  String course;
  int score;

  Homework(this.title, this.deadline, this.estimatedTime, {this.description = '', this.completed = false, this.course = '', this.score = 0});
}

class YourHomework extends StatefulWidget {
  @override
  _YourHomeworkState createState() => _YourHomeworkState();
}

class _YourHomeworkState extends State<YourHomework> {
  List<Homework> homeworkList = [
    Homework('تمرین شماره نهم', DateTime.now().add(Duration(days: 3)), Duration(hours: 2), description: 'تمرین های فصل سوم را کامل کنید.', course: 'ریاضی دو', score: 0),
    Homework('کوییز دوم', DateTime.now().subtract(Duration(days: 1)), Duration(hours: 10), description: 'کل فصل دوم را برای کوییز جلسه بعد بخوانید.', course: 'مدار های الکتریکی', score: 90),
    Homework('چند ریسمانی', DateTime.now().add(Duration(days: 5)), Duration(minutes: 30), description: 'درباره multi-threading بخوانید.', course: 'برنامه نویسی', score: 0),
  ];

  List<Homework> get upcomingHomeworks {
    return homeworkList.where((homework) => !homework.deadline.isBefore(DateTime.now())).toList();
  }

  List<Homework> get pastDeadlineHomeworks {
    return homeworkList.where((homework) => homework.deadline.isBefore(DateTime.now())).toList();
  }

  void updateEstimatedTime(Homework homework, Duration newTime) {
    setState(() {
      homework.estimatedTime = newTime;
    });
  }

  void updateDescription(Homework homework, String newDescription) {
    setState(() {
      homework.description = newDescription;
    });
  }

  void showHomeworkDetails(Homework homework) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController estimatedTimeController = TextEditingController(text: homework.estimatedTime.inHours.toString());
        TextEditingController descriptionController = TextEditingController(text: homework.description);

        return AlertDialog(
          title: Text(homework.title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('نام درس: ${homework.course}'),
                Text('نمره شما: ${homework.score}', style: TextStyle(color: Colors.black)), // تغییر رنگ متن Score به مشکی
                Text('تعداد روز های باقی مانده: ${homework.deadline.difference(DateTime.now()).inDays}'),
                SizedBox(height: 10,),
                TextField(
                  controller: estimatedTimeController,
                  decoration: InputDecoration(labelText: 'زمان باقی مانده (ساعت)'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Validate and update estimated time
                    int hours = int.tryParse(value) ?? 0;
                    updateEstimatedTime(homework, Duration(hours: hours));
                  },
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'توضیحات'),
                  onChanged: (value) {
                    // Update description
                    updateDescription(homework, value);
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('تمام',
              style: TextStyle(
                color: Colors.teal.shade900,
              ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text('تمرین ها',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: 'Baloo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'تمرین های پیش رو:',
                  style: TextStyle(fontSize: 20,
                      fontFamily: 'Baloo',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: upcomingHomeworks.length,
                itemBuilder: (context, index) {
                  Homework homework = upcomingHomeworks[index];
                  return Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    color: Colors.teal.shade100,
                    child: ListTile(
                      onTap: () => showHomeworkDetails(homework),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        homework.title,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), // تنظیم رنگ متن به سفید
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Text('ددلاین: ${DateFormat('yyyy-MM-dd').format(homework.deadline)}', style: TextStyle(color: Colors.white,),),
                          Text('زمان تخمینی: ${homework.estimatedTime.inHours} ساعت', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white), // تنظیم رنگ آیکون ادیت به سفید
                        onPressed: () {
                          showHomeworkDetails(homework); // باز کردن دیالوگ برای ویرایش
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'تمرین های انجام شده:',
                style: TextStyle(
                  fontFamily: 'Baloo',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pastDeadlineHomeworks.length,
                itemBuilder: (context, index) {
                  Homework homework = pastDeadlineHomeworks[index];
                  return Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    color: Colors.teal.shade100, // تنظیم رنگ ویجت به teal.shade 300
                    child: ListTile(
                      onTap: () => showHomeworkDetails(homework),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        homework.title,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), // تنظیم رنگ متن به سفید
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Text('ددلاین: ${DateFormat('yyyy-MM-dd').format(homework.deadline)}', style: TextStyle(color: Colors.white,
                          fontFamily: 'Baloo'),),
                          Text('زمان تخمینی: ${homework.estimatedTime.inHours} ساعت', style: TextStyle(color: Colors.white,
                          fontFamily: 'Baloo'),),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white), // تنظیم رنگ آیکون ادیت به سفید
                        onPressed: () {
                          showHomeworkDetails(homework); // باز کردن دیالوگ برای ویرایش
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

