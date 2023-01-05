import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'theme/color_schemes.dart';
import 'package:google_fonts/google_fonts.dart';

List<CameraDescription> cameras = [];

void main() {
// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`

//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     print('Error in fetching the cameras: $e');
//   }

//   // Obtain a list of the available cameras on the device.

//   // Get a specific camera from the list of available cameras.

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
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: MainPage(),
      initialRoute: '/',
      routes: {
        '/main': (BuildContext context) => const MainPage(),
      },
    );
  }
}
