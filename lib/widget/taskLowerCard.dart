import 'package:flutter/material.dart';

import 'package:habit_tracker/models/tasks.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:lottie/lottie.dart';

class TasksList extends StatelessWidget {
  final List<Tasks> tasks;
  final Function deleteTasks;
  const TasksList({
    Key? key,
    required this.tasks,
    required this.deleteTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Container(
                child: Lottie.asset(
              "lib/assets/images/Checklist.json",
            ));
          })
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Card(
                  color: mobileBackgroundColor,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  elevation: 10,
                  child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: FittedBox(child: Text("@50")),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          tasks[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      subtitle: Text("5 from 7 this week"),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTasks(tasks[index].id))));
            });
  }
}
