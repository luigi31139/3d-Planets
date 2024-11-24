import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ModelViewer(src:"assets/earth.glb")
    );
  }
}