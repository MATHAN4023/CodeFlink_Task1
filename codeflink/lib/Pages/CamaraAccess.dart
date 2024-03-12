import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CamAccess extends StatefulWidget {
  const CamAccess({Key? key}) : super(key: key);

  @override
  State<CamAccess> createState() => _CamAccessState();
}

class _CamAccessState extends State<CamAccess> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

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
    return _controller.initialize();
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
      ),
      body: FutureBuilder<void>(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Take a picture and save it to the gallery
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            print('Image saved to: ${image.path}');
          } catch (e) {
            print('Error: $e');
          }
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () async {
                // Open camera
                await _initializeControllerFuture;
                // Add your camera functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
