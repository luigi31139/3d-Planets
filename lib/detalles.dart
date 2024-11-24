import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PlanetDetail extends StatefulWidget {
  final Map planet;

  const PlanetDetail({super.key, required this.planet});

  @override
  State<PlanetDetail> createState() => _PlanetDetailState();
}

class _PlanetDetailState extends State<PlanetDetail> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
  }

  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, title: Text('${widget.planet["name"]}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 300,width: 300,
              child: ModelViewer(src: "assets/${widget.planet["image"]}",autoRotate: true,autoRotateDelay: 0,autoPlay: true,disableZoom: true,cameraControls: false,rotationPerSecond: "20deg",),),
              const SizedBox(height: 20),
              Text('First Detailed Observation: ${widget.planet["Observed"]}'),
              const SizedBox(height: 20),
              Text('Diameter: ${widget.planet["diameter-size"]}'),
              const SizedBox(height: 20),
              Text('Description: ${widget.planet["description"]}'),
            ],
          ),
        ),
      ),
    );
  }
}