// CamAccess.dart
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:codeflink/Pages/EnterDetails.dart';
import 'package:codeflink/Pages/HomePage.dart';
import 'package:flutter/material.dart';

import 'FullScreenImageGallery.dart';

class CamAccess extends StatefulWidget {
  const CamAccess({Key? key}) : super(key: key);

  @override
  State<CamAccess> createState() => _CamAccessState();
}

class _CamAccessState extends State<CamAccess> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<String> _imagePaths = []; // List to hold paths of the taken images
  int? _deletedIndex; // Index of the deleted image

  // States for each FloatingActionButton's elevation
  double addIconElevation = 0.0;
  double cameraIconElevation = 0.0;
  double checkIconElevation = 0.0;

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    // Ensure that the _controller is initialized before accessing it
    await _controller.initialize();

    // Handle image deletion when returning from full screen image view
    _controller.addListener(() {
      if (!_controller.value.isTakingPicture) {
        if (_deletedIndex != null) {
          setState(() {
            _imagePaths.removeAt(_deletedIndex!);
            _deletedIndex = null;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Preview'),
        // ------- Adding a back button to the app bar
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => HomePage()),
        //     );
        //   },
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the camera preview
                      return CameraPreview(_controller);
                    } else {
                      // Otherwise, display a loading indicator
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _imagePaths.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          _deletedIndex = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImageGallery(
                                imagePaths: _imagePaths,
                                initialIndex: index, // Pass initialIndex here
                              ),
                            ),
                          );
                        },
                        child: Image.file(
                          File(_imagePaths[index]),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.cancel_outlined),
                        onPressed: () {
                          setState(() {
                            _imagePaths.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Reset elevation for other icons
              setState(() {
                addIconElevation = 6.0;
                cameraIconElevation = 0.0;
                checkIconElevation = 0.0;
              });
              // Add functionality for the additional icon here
            },
            child: Icon(Icons.add),
            elevation: addIconElevation,
          ),
          FloatingActionButton(
            onPressed: () async {
              // Reset elevation for other icons
              setState(() {
                addIconElevation = 0.0;
                cameraIconElevation = 6.0;
                checkIconElevation = 0.0;
              });
              try {
                // Take a picture and save it to the gallery
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                setState(() {
                  _imagePaths.add(
                      image.path); // Add path of the taken image to the list
                });
                print('Image saved to: ${image.path}');
              } catch (e) {
                print('Error: $e');
              }
            },
            child: Icon(Icons.camera),
            elevation: cameraIconElevation,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterDetails(),
                ),
              );
              setState(() {
                addIconElevation = 0.0;
                cameraIconElevation = 0.0;
                checkIconElevation = 6.0;
              });
              // Add functionality for the check icon here
            },
            child: Icon(Icons.check),
            elevation: checkIconElevation,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
