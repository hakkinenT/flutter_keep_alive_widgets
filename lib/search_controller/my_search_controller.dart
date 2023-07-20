import 'package:flutter/material.dart';

import 'user_data.dart';

class MySearchController extends ChangeNotifier {
  List<String> u = [];

  void filterChanged(String? filter) {
    if (filter == null) {
      u = users;
    } else {
      u = users
          .where(
            (element) => element.toLowerCase().contains(filter.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }

  List<String> get fUser => u;
}
