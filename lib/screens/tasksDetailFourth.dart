import 'package:flutter/material.dart';

class TasksDetailPage extends StatefulWidget {
  final String taskId;

  const TasksDetailPage({
    Key? key,
    required this.taskId,
  }) : super(key: key);

  @override
  State<TasksDetailPage> createState() => _TasksDetailPageState();
}

class _TasksDetailPageState extends State<TasksDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
    );
  }
}
