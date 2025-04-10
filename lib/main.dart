import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 173, 95, 0)),
      ),
      home: const MyHomePage(title: 'Round Pic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     // _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row( children: [
          Icon(
            Icons.downhill_skiing_sharp,
          ),
          const Text('FIRST PAGE'),
        ])
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage() ))}, 
          child: const Text('To NextPage')
        ),
      ]),
      drawer: const Drawer(child: Center(child: Text('drawer'))),
      endDrawer: const Drawer(child: Center(child: Text('end drawer'))),
    );
  }
}

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool _isImageVisible = false;

  void _showImage() {
    setState(() {
      _isImageVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row( children: [
          Icon(
            Icons.downhill_skiing_sharp,
          ),
          const Text('NEXT PAGE'),
        ])
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => {Navigator.pop(context)}, 
            child: const Text('To Previous Page')
          ),

          const SizedBox(height: 20),

          GestureDetector(
              onTap: _showImage,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'タップして画像を表示',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),

          if(_isImageVisible)
            Image.asset(
              'images/riki.jpeg',
              width: 200,
              height: 200,
            ),


        ]
      ),
    );
  }
}