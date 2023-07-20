import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class TextBook extends StatefulWidget {
  const TextBook({super.key});

  @override
  State<TextBook> createState() => _TextBookState();
}

class _TextBookState extends State<TextBook>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
