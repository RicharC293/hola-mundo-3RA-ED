import 'package:flutter/material.dart';

//mateapp
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUILD_MyApp");
    return MaterialApp(
      title: 'Hola Mundo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Hola Mundo'),
          actions: const [
            Icon(Icons.add_a_photo),
            Icon(Icons.abc_rounded),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              // Widget 1
              Container(
                color: Colors.red,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //Widget 1
                    MiWidget(
                      text: 'Mi primer texto',
                      icon: Icons.abc,
                    ),
                    // Widget 2
                    MiWidget(
                      text: 'Mi segundo text',
                      icon: Icons.ac_unit,
                    ),
                    // Widget 3
                    MiWidget(
                      text: 'Mi tercer texto',
                      icon: Icons.access_alarm,
                    ),
                  ],
                ),
              ),

              // Widget 2
              const MiWidgetStateful(),
            ],
          ),
        ),
      ),
    );
  }
}

class MiWidget extends StatelessWidget {
  const MiWidget({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    print("BUILD_MiWidget");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        Icon(icon),
      ],
    );
  }
}

class MiWidgetStateful extends StatefulWidget {
  const MiWidgetStateful({super.key});

  @override
  State<MiWidgetStateful> createState() => _MiWidgetStatefulState();
}

class _MiWidgetStatefulState extends State<MiWidgetStateful> {
  late int _contador;

  // Método que se ejecuta al inicio (Cuando se crea el widget)
  // Nos sirve para inicializar métodos - programación asincrona
  // Se ejecuta antes del primer frame (initState) [][][][]
  @override
  void initState() {
    super.initState();
    _contador = 0;
    print("INIT_STATE");
  }

  /// Método que se ejecuta al final el widget (Destruye)
  /// Cerrar controladores, timers
  /// [][][] (dispose)
  @override
  void dispose() {
    print("DISPOSE");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD_MiWidgetStateful");
    return Column(
      children: [
        Text("Contador: $_contador"),
        TextButton(
          onPressed: () {
            _contador++;
            setState(() {});
            print(_contador);
          },
          child: const Text("Sumar Contador"),
        ),
      ],
    );
  }
  /// Inicia un widget
  /// initState -> Renderiza(build) -> dispose
  /// setState(() {}); -> Vuelve a ejecutar el build 
  /// Cuidado! con el uso excesivo setState(() {})
  /// Otras cosas 
  /// mounted -> Define si el widget existe o no en el árbol de widgets
}
