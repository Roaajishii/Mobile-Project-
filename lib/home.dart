import 'package:flutter/material.dart';
import 'mycheckboxelist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task Tracker', style: TextStyle(fontSize: 24),),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Container (
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image22.jpg'),
              fit: BoxFit.cover,
               )
          ),
          child: Column(
              children: [
                const SizedBox(height: 100),
                ElevatedButton(onPressed:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyCheckboxList())
                  );
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Get Started'),
                ),
                const SizedBox( height: 10),
              ]),
        ),
      ),
    );
  }
}
