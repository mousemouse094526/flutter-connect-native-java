import 'package:flutter/material.dart';
import 'package:flutter_native/src/services/native_bridge.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nativeBridge = NativeBridge();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Native Code Example')),
      body: Center(
        child: FutureBuilder<String>(
          future: nativeBridge.getNativeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Native data: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
