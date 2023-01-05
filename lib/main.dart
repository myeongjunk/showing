import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'homepage.dart';
import 'theme/color_schemes.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  // Obtain a list of the available cameras on the device // Get a specific camera from the list of available cameras.
  runApp(Showing());
}

class Showing extends StatelessWidget {
  const Showing({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      home: MainPage(),
      initialRoute: '/',
      routes: {
        '/main': (BuildContext context) => const MainPage(),
      },
    );
  }
}
