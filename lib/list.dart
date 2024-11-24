import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:planets/detalles.dart';

class PlanetList extends StatefulWidget {
  const PlanetList({super.key});

  @override
  State<PlanetList> createState() => _PlanetListState();
}

class _PlanetListState extends State<PlanetList> with TickerProviderStateMixin {
  List planets = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/planets.json');
    final data = await json.decode(response);
    setState(() {
      planets = data["items"];
    });
  }


  @override
  void initState() {
    super.initState();
    readJson();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Planet List')),
        body: Column(
          children: [
            planets.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: planets.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(planets[index]["id"]),
                          margin: const EdgeInsets.all(10),
                          color: Colors.blue[80],
                          child: ListTile(
                              leading: SizedBox(
                                height: 50,
                                width: 50,
                                child: ModelViewer(src: "assets/${planets[index]["image"]}",autoRotate: true,autoRotateDelay: 0,autoPlay: true,disableZoom: true,cameraControls: false,rotationPerSecond: "20deg",),
                              ),
                              title: Text(planets[index]["name"]),
                              trailing: Text(planets[index]["Observed"]),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => PlanetDetail(
                                            planet: planets[index]))));
                              }),
                        );
                      },
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: const Center(child: Text("Load Data")),
                  ),
          ],
        ));
  }
}
