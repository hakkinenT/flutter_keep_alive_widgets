import 'package:flutter/material.dart';

import '../widgets/animated_widget.dart';
import '../widgets/page_1.dart';
import '../widgets/text_book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: PageView.custom(
        controller: pageController,
        childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return KeepAlive(
                data: widgetsList[index],
                key: ValueKey<Widget>(widgetsList[index]),
              );
            },
            childCount: widgetsList.length,
            findChildIndexCallback: (Key key) {
              final ValueKey<Widget> valueKey = key as ValueKey<Widget>;
              final Widget data = valueKey.value;
              return widgetsList.indexOf(data);
            }),
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

class KeepAlive extends StatefulWidget {
  const KeepAlive({super.key, required this.data});

  final Widget data;

  @override
  State<KeepAlive> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.data;
  }
}
