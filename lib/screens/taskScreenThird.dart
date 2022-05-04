import 'package:flutter/material.dart';
import 'package:habit_tracker/providers/userProvider.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:habit_tracker/widget/taskMiddleDateCard.dart';
import 'package:habit_tracker/widget/taskUpperCard.dart';
import 'package:provider/provider.dart';

import '../widget/taskLowerCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appBar = AppBar(
    title: const Text(
      "Most Popular Habits",
      style: TextStyle(fontSize: 22),
    ),
    backgroundColor: mobileBackgroundColor,
    elevation: 0.0,
    actions: [
      Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Consumer<UserProvider>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  value.startAddNewTask(context);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Icon(
                      Icons.circle,
                      color: iconColor,
                      size: 40,
                    ),
                    Icon(
                      Icons.add,
                      color: primaryColor,
                      size: 22,
                    )
                  ],
                ),
              );
            },
          ))
    ],
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
          child: Consumer<UserProvider>(builder: (context, value, child) {
        return Column(
          children: [
            //TaskUpperCard
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.19,
                child: UpperTaskList(upperCardTasks: value.userTasks),
              ),
            ),

            //Opacity
            const Opacity(opacity: 0.0, child: Divider()),

            //TaskMiddleCard
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.115,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Color.fromARGB(255, 38, 50, 66)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: MiddleDateList(),
                ),
              ),
            ),

            //Opacity
            Opacity(
                opacity: 0.0,
                child: Divider(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.05,
                )),

            //Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Your Habits",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            //Opacity
            Opacity(
                opacity: 0.0,
                child: Divider(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.04,
                )),
            //TaskLowerCard
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.43,
                child: TasksList(
                  deleteTasks: value.deleteTransaction,
                ),
              ),
            )
          ],
        );
      })),
    );
  }
}
