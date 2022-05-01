import 'package:flutter/material.dart';
import 'package:habit_tracker/providers/userProvider.dart';
import 'package:habit_tracker/util/colors.dart';
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
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Consumer<UserProvider>(builder: (context, value, child) {
                return Column(
                  children: [
                    //TaskUpperCard
                    Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.19,
                      color: Colors.grey,
                    ),

                    //Opacity
                    const Opacity(opacity: 0.0, child: Divider()),

                    //TaskMiddleCard
                    Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.09,
                      color: Colors.brown,
                    ),

                    //Opacity
                    const Opacity(opacity: 0.0, child: Divider()),

                    //TaskLowerCard
                    Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.56,
                      // color: Colors.blue,
                      child: TasksList(
                        tasks: value.userTasks,
                        deleteTasks: value.deleteTransaction,
                      ),
                    )
                  ],
                );
              }))),
    );
  }
}
