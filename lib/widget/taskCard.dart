import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  String title;
  String description;
  TaskCardWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.07,
            horizontal: MediaQuery.of(context).size.width * 0.07),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: Colors.blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Yoga Practice",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Yoga Daily Practice",
            )
          ],
        ),
      ),
    );
  }
}
