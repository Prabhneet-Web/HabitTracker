import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';

import '../models/tasks.dart';
import '../widget/newTasks.dart';

class UserProvider with ChangeNotifier {
  final List<Tasks> userTasks = [];
  int id = 0;

  List<Tasks> get fetchUserTasks {
    var currentDate = DateTime.now();
    return [
      ...userTasks
          .where((element) => !element.archivedMap[currentDate]!)
          .toList()
    ];
  }

  void addNewTasks(String tkTitle, DateTime chosenDate) {
    Map<DateTime, bool> tempMap = {};
    var currentDateTime = DateTime.now();
    for (int i = 0; i < 7; i++) {
      tempMap[currentDateTime.add(Duration(days: i))] = false;
    }
    final newTk = Tasks(
        id: DateTime.now().toIso8601String(),
        title: tkTitle,
        date: chosenDate,
        archivedMap: tempMap);
    userTasks.add(newTk);
    notifyListeners();
  }

  void startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: mobileBackgroundColor,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTasks(addTk: addNewTasks),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void deleteTransaction(String id) {
    userTasks.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }

  void toggleArchive(String id) {
    int index = userTasks.indexWhere((element) => element.id == id);
    userTasks[index].toggleArchive();
    notifyListeners();
  }
}
