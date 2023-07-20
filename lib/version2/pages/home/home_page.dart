import 'package:flutter/material.dart';

import '../widgets/animated_widget.dart';
import '../widgets/page_1.dart';
import '../widgets/text_book.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({super.key});

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  List<Widget> widgetsList = <Widget>[
    const PageProvider(),
    const TextBook(),
    const AnimatedContainerExample(),
  ];

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page view with keep alive'),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: widgetsList.length,
        itemBuilder: (context, index) => widgetsList[index],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
              icon: const Icon(Icons.chevron_left),
            ),
            const SizedBox(
              width: 35,
            ),
            IconButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
