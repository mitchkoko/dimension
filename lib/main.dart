import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double width = screenSize.width;
    double height = screenSize.height;
    double aspectRatio = screenSize.aspectRatio;
    bool thisIsMobile = true;

    if (width > height) {
      thisIsMobile = false;
    } else {
      thisIsMobile = true;
    }

    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('width: ' + width.toString()),
            Text('height: ' + height.toString()),
            Text('aspect ratio: ' + aspectRatio.toStringAsFixed(2)),
            Text('device: ' + (thisIsMobile ? 'mobile' : 'web')),
          ],
        ),
      ),
    );
  }
}
