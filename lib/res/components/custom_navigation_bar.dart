import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/components/web_navigation_bar.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currenIndex = 0;
  List pages = [
    Container(
      width: double.infinity,
      height: Get.height,
      color: Colors.amber,
      child: const Text('kfjd'),
    ),
    Container(
      width: double.infinity,
      height: Get.height,
      color: Colors.red,
      child: const Text('kfjd'),
    ),
    Container(
      width: double.infinity,
      height: Get.height,
      color: Colors.yellow,
      child: const Text('kfjd'),
    ),
    Container(
      height: Get.height,
      color: Colors.purple,
      child: const Text('kfjd'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < 600
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      body: Row(
        children: [
          if (MediaQuery.sizeOf(context).width >= 600) const WebNavigationBar(),
          Expanded(
            child: pages[currenIndex],
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: Get.width * .45,
        child: const WebNavigationBar(),
      ),
    );
  }
}
