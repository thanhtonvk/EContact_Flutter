import 'package:econtact/views/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 650));

    offset = Tween(begin: Offset.zero, end: const Offset(0.0, -2.0))
        .animate(controller);
    controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final response = await Future.delayed(const Duration(seconds: 1));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: SlideTransition(
              position: offset,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    width: 120,
                    height: 120,
                    child: Image.asset('assets/images/logo_khoa.png'),
                  ),
                  const Text(
                    'EContact',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
