import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';

class TasksDetailPage extends StatelessWidget {
  final String taskTitle;

  const TasksDetailPage({
    Key? key,
    required this.taskTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0, backgroundColor: mobileBackgroundColor),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              taskTitle,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "lib/assets/images/chart.png",
              fit: BoxFit.cover,
            ),
          )
        ],
      )),
    );
  }
}
