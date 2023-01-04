import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(
          "Comb",
          style: TextStyle(
              fontSize: 32.0,
              fontFamily: 'Alice',
              color: Color.fromARGB(255, 218, 69, 99)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 32, 45),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Welcome to Comb...'),
            ),
            ListTile(
              title: const Text("Login"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Register"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("About"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}