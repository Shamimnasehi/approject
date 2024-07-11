import 'package:Daneshjooyar/widgets/TodoItem.dart';
import 'package:flutter/material.dart';
import '../models/Todo.dart';

class TodoList extends StatefulWidget {

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final finalTodosList = Todo.myTodoList();
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text(
          'کار ها',
          textAlign: TextAlign.right, // RTL alignment for the title text
          style: TextStyle(
            fontFamily: 'Baloo', // Setting Persian font using fontFamily
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          'کار های امروز شما: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Baloo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for (Todo todoo in finalTodosList)
                        TodoItem(
                          todo: todoo,
                          onTodoChanged: _handleTodoChange,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal.shade900,
        icon: Icon (Icons.add),
        onPressed: () async {
          final newTask = await openPopUp();
          if (newTask == null || newTask.isEmpty) return;
          setState(() {
            _addTodoItem(newTask);
          });
        },
        label: Text ('اضافه کردن کار چدید'),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      finalTodosList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String todo) {
    setState(() {
      finalTodosList.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo,),);
    });
    controller.clear();
  }

  Future<String?> openPopUp() => showDialog<String?>(
    context: context,
    builder: (builder) => AlertDialog(
      title: Text(
        'اطلاعات کار جدید خود را وارد کنید.',
        style: TextStyle(
          fontFamily: 'Baloo',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'عنوان کار جدید را وارد کنید',
        ),
        controller: controller,
      ),
      backgroundColor: Colors.grey.shade200,
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop(controller.text);
          },
          child: Text(
            'اعمال کردن',
            style: TextStyle(
              color: Colors.teal.shade900,
            ),
          ),
        ),
      ],
    ),
  );
}


// Align(
//   alignment: Alignment.bottomCenter,
//   child: Container(
//     margin: EdgeInsets.only(bottom: 20, left: 20),
//     child: ElevatedButton(
//       child: Text('+', style: TextStyle(
//         color: Colors.white,
//         fontSize: 40,
//       ),
//       ),
//       onPressed: () {
//         _addTodoItem(_todoController.text);
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.teal.shade900,
//         minimumSize: Size(60, 60),
//         elevation: 10,
//       ),
//     ),
//   ),
// ),
