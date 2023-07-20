import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class TextBook extends StatelessWidget {
  const TextBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
