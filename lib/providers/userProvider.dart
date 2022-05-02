import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';

import '../models/tasks.dart';
import '../widget/newTasks.dart';

class UserProvider with ChangeNotifier {
  final List<Tasks> userTasks = [];
  int id = 0;

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
            child: NewTasks(addTk: addNewTasks),
            behavior: HitTestBehavior.opaque,
          );
        });
  }




  void deleteTransaction(String id) {
    userTasks.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
