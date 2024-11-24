import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:planets/list.dart';
import 'package:quickalert/quickalert.dart';

// ignore: camel_case_types
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

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


  final trazo = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.black));

  final nombreusuario = TextEditingController();
  final contra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 37),

              const SizedBox(
                height: 300,
                width: 300,
                child: ModelViewer(src: "assets/earth.glb",autoRotate: true,autoRotateDelay: 0,autoPlay: true,disableZoom: true,cameraControls: false,rotationPerSecond: "20deg",),
              ),

              const SizedBox(height: 62),
              SizedBox(
                  width: 300,
                  child: TextField(
                      controller: nombreusuario,
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                          hintText: 'Nombre Usuario',
                          border: trazo,
                          prefixIcon: const Icon(Icons.person)))),
              const SizedBox(height: 37),


              SizedBox(
                  width: 300,
                  child: TextField(
                      controller: contra,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                          hintText: 'Contraseña',
                          border: trazo,
                          prefixIcon: const Icon(Icons.lock)))),
              const SizedBox(height: 37),
              
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF58138D),
                    borderRadius: BorderRadius.circular(10)),
                height: 42,
                width: 107,
                child: RawMaterialButton(
                  onPressed: () {
                    if (nombreusuario.text == 'luis' &&
                        contra.text == 'angel') {
                      nombreusuario.clear();
                      contra.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlanetList()));
                    } else {
                      nombreusuario.clear();
                      contra.clear();

                      QuickAlert.show(
                        context: context,
                        title: 'Error',
                        text: "Usuario o contraseña incorrecta",
                        type: QuickAlertType.error,
                      );
                      
                    }
                  },
                  child: const Text('Login',
                      style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'K2D',
                          color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}