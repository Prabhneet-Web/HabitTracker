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
  bool isArchived;
  Tasks(
      {required this.id,
      required this.title,
      required this.date,
      this.isArchived = false});

  Tasks.withId(
      {required this.id,
      required this.title,
      required this.date,
      this.isArchived = false});

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

  void toggleArchive() {
    isArchived = !isArchived;
  }
}
