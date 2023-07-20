import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../search_controller/my_search_controller.dart';

class PageProvider extends StatelessWidget {
  const PageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MySearchController(),
      child: const Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              onChanged: (value) =>
                  Provider.of<MySearchController>(context, listen: false)
                      .filterChanged(value),
              decoration: const InputDecoration(hintText: "Search.."),
            ),
          ),
          Expanded(
            flex: 6,
            child:
                Consumer<MySearchController>(builder: (context, controller, _) {
              return ListView.builder(
                  itemCount: controller.u.length,
                  itemBuilder: (context, index) {
                    final users = controller.u;

                    return ListTile(
                      title: Text(users[index]),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
