import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _vancouver = CameraPosition(
    target: LatLng(49.2827, -123.1207),
    zoom: 14.4746,
  );

  static const CameraPosition _nanaimo =
      CameraPosition(target: LatLng(49.16638, -123.94003), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Row(children: [
            Icon(Icons.water,
                color: Color.fromARGB(255, 218, 69, 99), size: 40.0),
            Text(
              "Comb",
              style: TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Alice',
                  color: Color.fromARGB(255, 218, 69, 99)),
            ),
          ]),
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
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Register"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("About"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _vancouver,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToNanaimo,
        //   label: const Text('To Nanaimo!'),
        //   icon: const Icon(Icons.directions_boat),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Harvest Locations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'Message Board',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Species Info',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToNanaimo() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_nanaimo));
  }
}
