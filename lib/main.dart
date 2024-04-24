/// Customize Check Box Button shape

import 'package:custom_widget_demo/CustomWidgets/custom_check_box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isBookMarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckbox(
              checkColor: Colors.red,
              color: Colors.green,
              iconSize: 15,
              width: 26,
              height: 26,
              onChanged: (p0) {},
            ),

            const SizedBox(
              height: 10,
            ),

            /// Original
            Transform.scale(
              scale: 1.6,
              child: Checkbox(
                shape: const CircleBorder(),
                activeColor: Colors.green,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (!states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return null;
                }),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                checkColor: Colors.white,
                side: const BorderSide(color: Colors.grey, width: 1.33),
                value: isBookMarked,
                onChanged: (bool? value) {
                  setState(() {
                    isBookMarked = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
