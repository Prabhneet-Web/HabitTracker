import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Most Popular Habits"),
        backgroundColor: mobileBackgroundColor,
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              alignment: Alignment.center,
              children: const [
                Icon(
                  Icons.circle,
                  color: iconColor,
                  size: 45,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 15))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
