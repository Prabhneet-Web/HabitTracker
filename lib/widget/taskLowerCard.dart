import 'package:flutter/material.dart';

import 'package:habit_tracker/models/tasks.dart';
import 'package:habit_tracker/providers/userProvider.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  final Function deleteTasks;
  const TasksList({
    Key? key,
    required this.deleteTasks,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final List<Tasks> tasks = Provider.of<UserProvider>(context).fetchUserTasks;

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
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                              // child: GestureDetector(
                              //     onTap: () {
                              //       Provider.of<UserProvider>(context,
                              //               listen: false)
                              //           .toggleArchive(tasks[index].id);
                              //     },
                              child: Checkbox(
                            value: this.value,
                            activeColor: Colors.grey,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value!;
                                Future.delayed(
                                    const Duration(milliseconds: 450), () {
                                  if (value == true) {
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .toggleArchive(tasks[index].id);
                                  }
                                  setState(() {
                                    this.value = !value;
                                  });
                                });
                              });
                            },
                          )
                              // )
                              ),
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
                          onPressed: () =>
                              widget.deleteTasks(tasks[index].id))));
            });
  }
}
