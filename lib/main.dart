import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyDrawer extends StatefulWidget {
  final Widget child;
  final Widget drawer;

  const MyDrawer({super.key, required this.child, required this.drawer});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  late AnimationController _xControllerForChild;
  late Animation<double> _yRotationAnimationForChild;

  late AnimationController _xControllerForDrawer;
  late Animation<double> _yRotationAnimationForDrawer;

  @override
  void initState() {
    super.initState();
    _xControllerForChild = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _yRotationAnimationForChild = Tween<double>(
        begin: 0,
        end: -pi / 2
    ).animate(_xControllerForChild);

    _xControllerForDrawer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _yRotationAnimationForDrawer = Tween<double>(
        begin: 0,
        end: -pi / 2
    ).animate(_xControllerForDrawer);
  }

  @override
  void dispose() {
    _xControllerForDrawer.dispose();
    _xControllerForChild.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyDrawer(
          drawer: Material(
            child: Container(
              color: const Color(0xff24283b),
              child: ListView.builder(padding: const EdgeInsets.only(left: 80, top: 100),itemCount: 20,itemBuilder: (context, index) {
                return ListTile(title: Text('Item $index'),);
              }),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Page'),
            ),
            body: Container(
              color: const Color(0xff414868),
            ),
          ),
        )
    );
  }
}

