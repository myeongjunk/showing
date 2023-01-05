import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'homepage.dart';
import 'main.dart';
import 'theme/color_schemes.dart';
import 'theme/font.dart';
import 'display_and_save_image_page.dart';

class TakePicturePage extends StatefulWidget {
  @override
  TakePicturePageState createState() => TakePicturePageState();
}

class TakePicturePageState extends State<TakePicturePage>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  final resolutionPresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 5.0;
  double _currentZoomLevel = 1.0;

  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;

  FlashMode? _currentFlashMode;

  bool _isRearCameraSelected = true;

  bool isImageInVisible = false;

  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  Widget showImage() {
    return _image == null
        ? Text(' ')
        : isImageInVisible
            ? Text('')
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: FileImage(_image!),
                    ),
                  ),
                ),
              );
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
      cameraController
          .getMaxZoomLevel()
          .then((value) => _maxAvailableZoom = value);

      cameraController
          .getMinZoomLevel()
          .then((value) => _minAvailableZoom = value);

      cameraController
          .getMinExposureOffset()
          .then((value) => _minAvailableExposureOffset = value);

      cameraController
          .getMaxExposureOffset()
          .then((value) => _maxAvailableExposureOffset = value);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  @override
  @override
  void initState() {
    // Hide the status bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    onNewCameraSelected(cameras[0]);
    super.initState();
    isImageInVisible = false;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            '',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.flip_camera_ios_outlined),
            onPressed: () async {
              setState(() {
                _isCameraInitialized = false;
              });
              onNewCameraSelected(
                cameras[_isRearCameraSelected ? 1 : 0],
              );
              setState(() {
                _isRearCameraSelected = !_isRearCameraSelected;
              });
            },
          )
        ],
      ),
      body: _isCameraInitialized
          ? Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                CameraPreview(controller!),

                                //Camera Brightness Controller
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          _currentExposureOffset
                                                  .toStringAsFixed(1) +
                                              'x',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Container(
                                        height: 30,
                                        child: Slider(
                                          value: _currentExposureOffset,
                                          min: _minAvailableExposureOffset,
                                          max: _maxAvailableExposureOffset,
                                          activeColor: Colors.white,
                                          inactiveColor: Colors.white30,
                                          onChanged: (value) async {
                                            setState(() {
                                              _currentExposureOffset = value;
                                            });
                                            await controller!
                                                .setExposureOffset(value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Camera Resolution Controller
                            DropdownButton<ResolutionPreset>(
                              dropdownColor: Colors.black87,
                              underline: Container(),
                              value: currentResolutionPreset,
                              items: [
                                for (ResolutionPreset preset
                                    in resolutionPresets)
                                  DropdownMenuItem(
                                    child: Text(
                                      preset
                                          .toString()
                                          .split('.')[1]
                                          .toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: preset,
                                  )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  currentResolutionPreset = value!;
                                  _isCameraInitialized = false;
                                });
                                onNewCameraSelected(controller!.description);
                              },
                              hint: Text("Select item"),
                            ),
                          ],
                        ),
                        showImage(),
                      ],
                    ),

                    // Camera Front-Rear Controller
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isCameraInitialized = false;
                                });
                                setState(() {
                                  _isRearCameraSelected =
                                      !_isRearCameraSelected;
                                });
                                onNewCameraSelected(
                                  cameras[_isRearCameraSelected ? 0 : 1],
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black38,
                                    size: 60,
                                  ),
                                  Icon(
                                    _isRearCameraSelected
                                        ? Icons.camera_front
                                        : Icons.camera_rear,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print('hello');
                                  setState(() {
                                    isImageInVisible = !isImageInVisible;
                                  });
                                },
                                hoverColor: Colors.transparent,
                                onHover: (value) {
                                  setState(() {
                                    isImageInVisible = value;
                                  });
                                  print(isImageInVisible);
                                },
                                child: Image.asset(
                                    'assets/images/showwing_logo.png')),
                          ],
                        ),

                        // Camera Zoom Controller
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: _currentZoomLevel,
                                min: _minAvailableZoom,
                                max: _maxAvailableZoom,
                                activeColor: Colors.white,
                                inactiveColor: Colors.white30,
                                onChanged: (value) async {
                                  setState(() {
                                    _currentZoomLevel = value;
                                  });
                                  await controller!.setZoomLevel(value);
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _currentZoomLevel.toStringAsFixed(1) + 'x',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // Camera Flash Mode
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _currentFlashMode = FlashMode.off;
                        });
                        await controller!.setFlashMode(
                          FlashMode.off,
                        );
                      },
                      child: Icon(
                        Icons.flash_off,
                        color: _currentFlashMode == FlashMode.off
                            ? Colors.amber
                            : Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _currentFlashMode = FlashMode.auto;
                        });
                        await controller!.setFlashMode(
                          FlashMode.auto,
                        );
                      },
                      child: Icon(
                        Icons.flash_auto,
                        color: _currentFlashMode == FlashMode.auto
                            ? Colors.amber
                            : Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _isCameraInitialized = false;
                        });
                        onNewCameraSelected(
                          cameras[_isRearCameraSelected ? 1 : 0],
                        );
                        setState(() {
                          _isRearCameraSelected = !_isRearCameraSelected;
                        });
                      },
                      child: Icon(
                        Icons.flash_on,
                        color: _currentFlashMode == FlashMode.always
                            ? Colors.amber
                            : Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _currentFlashMode = FlashMode.torch;
                        });
                        await controller!.setFlashMode(
                          FlashMode.torch,
                        );
                      },
                      child: Icon(
                        Icons.highlight,
                        color: _currentFlashMode == FlashMode.torch
                            ? Colors.amber
                            : Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            )
          : Container(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            child: Icon(Icons.image),
          ),
          FloatingActionButton(
            heroTag: 2,
            // Provide an onPressed callback.
            onPressed: () async {
              // Take the Picture in a try / catch block. If anything goes wrong,
              // catch the error.
              try {
                // Ensure that the camera is initialized.

                // Attempt to take a picture and get the file `image`
                // where it was saved.
                final image = await controller!.takePicture();

                if (!mounted) return;

                // If the picture was taken, display it on a new screen.
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayAndSaveImagePage(
                      // Pass the automatically generated path to
                      // the DisplayPictureScreen widget.
                      imagePath: image.path,
                    ),
                  ),
                );
              } catch (e) {
                // If an error occurs, log the error to the console.
                print(e);
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MainPage()),
                  (route) => false);
            },
            child: Image.asset('assets/images/showwing_logo.png'),
          ),
        ],
      ),
    );
  }
}
