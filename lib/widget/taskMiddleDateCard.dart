import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MiddleDateList extends StatelessWidget {
  const MiddleDateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                elevation: 3,
                child: ListTile(title: Text(DateFormat.MMMMd().format(DateTime.now()))),
              ),
            ),
          );
        });
  }
}
