class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
});

  static List<Todo> myTodoList() {
    return [
      Todo(id: '01', todoText: 'تمرین شماره یک مدار', isDone: false),
      Todo(id: '02', todoText: 'پروژه برنامه نویسی پیشرفته', isDone: true),
      Todo(id: '03', todoText: 'تمرین شماره سه ریاضی', isDone: false),
      Todo(id: '04', todoText: 'سوال کلاسی فیزیک')
    ];
  }
}