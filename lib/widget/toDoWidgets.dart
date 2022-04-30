import 'package:flutter/material.dart';

import '../util/colors.dart';

class ToDoWidget extends StatelessWidget {
  final String text;
  final bool isDone;
  const ToDoWidget({
    Key? key,
    required this.text,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(children: [
          Container(
            height: 20.0,
            width: 20.0,
            alignment: Alignment.center,
            child: checkBox(),
            margin: const EdgeInsets.only(right: 15),
          ),

          //Todo List
          Text(
            text,
            style: TextStyle(
                fontSize: 17, color: isDone ? Colors.white : Colors.grey),
          ),
        ]),
      ),
    );
  }

  Widget checkBox() {
    return isDone
        ? Stack(
            children: const [
              Icon(
                Icons.rectangle_outlined,
                color: iconColor,
                size: 25,
              ),
              Icon(
                Icons.check,
                color: Colors.white,
                size: 15,
              ),
            ],
          )
        : const Icon(
            Icons.rectangle_outlined,
            color: Colors.grey,
          );
  }

  
}
