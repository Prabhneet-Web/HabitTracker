final String tableTasks = "tasks";

class TasksFields {
  static final List<String> values = [colId, colTitle, colDate];
  static const String colId = "_id";
  static const String colTitle = "title";
  static const String colDate = "date";
}

class Tasks {
  final String id;
  final String title;
  final DateTime date;
  Tasks({required this.id, required this.title, required this.date});

  Tasks.withId({required this.id, required this.title, required this.date});

  Tasks copy({String? id, String? title, DateTime? date}) => Tasks(
      id: id ?? this.id, title: title ?? this.title, date: date ?? this.date);

  //Now, let's create a function that will turn our data into Map
  //Make sure that the key used here have the same name as the table column

  Map<String, dynamic> toJson() {
    return ({
      TasksFields.colId: id,
      TasksFields.colTitle: title,
      TasksFields.colDate: date.toIso8601String()
    });
  }

  static Tasks fromJson(Map<String, Object?> json) {
    return Tasks.withId(
        id: json[TasksFields.colId] as String,
        title: json[TasksFields.colTitle] as String,
        date: DateTime.parse(json[TasksFields.colDate] as String));
  }
}
