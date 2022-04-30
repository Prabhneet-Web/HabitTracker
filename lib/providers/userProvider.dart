import 'package:flutter/material.dart';

import '../models/tasks.dart';

class UserProvider with ChangeNotifier {
  final List<Tasks> userTasks = [];
}
