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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Your Habits",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Lottie.asset(
                  "lib/assets/images/Checklist.json",
                ),
              ],
            ));
          })
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Card(
                  color: mobileBackgroundColor,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  elevation: 10,
                  child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: FittedBox(child: Text("@50")),
                        ),
                      ),
                      title: Text(
                        tasks[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      subtitle: Text("5 from 7 this week"),
                      trailing: MediaQuery.of(context).size.width > 360
                          ? TextButton.icon(
                              style: TextButton.styleFrom(
                                  primary: (Theme.of(context).errorColor)),
                              onPressed: () => deleteTasks(tasks[index].id),
                              icon: const Icon(Icons.delete),
                              label: const Text("Delete"))
                          : IconButton(
                              icon: const Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () => deleteTasks(tasks[index].id))));
            });
  }
}
