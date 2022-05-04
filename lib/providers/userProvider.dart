import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';

import '../models/tasks.dart';
import '../widget/newTasks.dart';

class UserProvider with ChangeNotifier {
  final List<Tasks> userTasks = [];
  int id = 0;

  List<Tasks> get fetchUserTasks {
    return [...userTasks.where((element) => !element.isArchived).toList()];
  }

  void addNewTasks(String tkTitle, DateTime chosenDate) {
    final newTk = Tasks(
        id: DateTime.now().toIso8601String(), title: tkTitle, date: chosenDate);
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
            child: NewTasks(addTk: addNewTasks, isArchived: false),
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
