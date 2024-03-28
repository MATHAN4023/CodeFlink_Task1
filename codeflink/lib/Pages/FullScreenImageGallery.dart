import 'dart:io';

import 'package:flutter/material.dart';

class FullScreenImageGallery extends StatelessWidget {
  final List<String> imagePaths;
  final int initialIndex; // Add initialIndex parameter

  const FullScreenImageGallery({
    Key? key,
    required this.imagePaths,
    required this.initialIndex, // Update constructor to accept initialIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: PageView.builder(
        itemCount: imagePaths.length,
        controller:
            PageController(initialPage: initialIndex), // Set initialPage
        itemBuilder: (context, index) {
          return Center(
            child: Image.file(
              File(imagePaths[index]),
              fit: BoxFit.contain, // Fit the entire image within the screen
            ),
          );
        },
      ),
    );
  }
}
