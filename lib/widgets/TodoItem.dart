import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onTodoChanged;
  final onDeleteItem;

  TodoItem({Key? key, required this.todo, required this.onTodoChanged, required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTodoChanged(todo);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.teal.shade100,
        leading: Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        color: Colors.white,
        ),
        title: Text(todo.todoText!,
        style: TextStyle(
          fontFamily: 'Baloo',
          decoration: todo.isDone? TextDecoration.lineThrough : null,
        ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            padding: EdgeInsets.all(0),
            color: Colors.white,
            iconSize: 15,
            icon: Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
