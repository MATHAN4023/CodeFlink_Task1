import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MemoryContainer1 extends StatefulWidget {
  const MemoryContainer1({Key? key}) : super(key: key);

  @override
  State<MemoryContainer1> createState() => _MemoryContainer1State();
}

class _MemoryContainer1State extends State<MemoryContainer1> {
  final List<String> images = [
    'lib/Assets/Temple/Colourful-temples.webp',
    'lib/Assets/Temple/madurai-meenakshi-amman-temple.webp',
    'lib/Assets/Temple/tourists-at-meenakshi-amman-temple-in-madurai-india.webp',
    // Add more image paths here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Captured memories '),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: CarouselSlider(
            items: images.map((String imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FullScreenImage(imagePath: imagePath),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
