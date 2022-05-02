import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/tasks.dart';

class UpperTaskList extends StatelessWidget {
  final List<Tasks> upperCardTasks;

  const UpperTaskList({
    Key? key,
    required this.upperCardTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return upperCardTasks.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Container();
          })
        : LayoutBuilder(builder: (ctx, constraints) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upperCardTasks.length,
                itemBuilder: (context, index) {
                  String upperTask = upperCardTasks[index].title[0];
                  for (int i = 0; i < upperCardTasks[index].title.length; i++) {
                    if (upperCardTasks[index].title[i] == " ") {
                      upperTask +=
                          (upperCardTasks[index].title[i + 1]).toUpperCase();
                    }
                  }
                  final randomColor =
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0);
                  return Padding(
                    padding: const EdgeInsets.only(right: 9.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        shadowColor: randomColor,
                        elevation: 15,
                        color: randomColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: 10),
                              child: ListTile(
                                  title: Text(
                                upperTask,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              )),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                  title: Text(
                                upperCardTasks[index].title,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
            ;
          });
  }
}
