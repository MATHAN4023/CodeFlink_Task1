import 'package:carousel_slider/carousel_slider.dart';
import 'package:codeflink/Pages/Trackingorder.dart';
import 'package:flutter/material.dart';

class MemoryContainer1 extends StatefulWidget {
  const MemoryContainer1({Key? key}) : super(key: key);

  @override
  State<MemoryContainer1> createState() => _MemoryContainer1State();
}

class _MemoryContainer1State extends State<MemoryContainer1> {
  final List<String> images = [
    'lib/Assets/banners/banner1.webp',
    'lib/Assets/banners/banner2.webp',
    'lib/Assets/banners/banner3.webp',
  ];

  final CarouselController _carouselController = CarouselController();

  String siteName = 'Text';
  String height = '120cm';
  String width = '120';
  String phoneNo = '1234567890';
  String emailAddress = 'TEst@gmail.com';
  String description = 'Box contains Text';

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Captured memories'),
          
          backgroundColor: Colors.purpleAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(isEditing ? Icons.done : Icons.edit),
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: kToolbarHeight),
              CarouselSlider(
                carouselController: _carouselController,
                items: images.map((String imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  FullScreenImage(imagePath: imagePath),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  scrollPhysics: BouncingScrollPhysics(),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(
                      label: 'Site Name',
                      value: siteName,
                      editable: isEditing,
                    ),
                    _buildDetailRow(
                      label: 'Height',
                      value: height,
                      editable: isEditing,
                    ),
                    _buildDetailRow(
                      label: 'Width',
                      value: width,
                      editable: isEditing,
                    ),
                    _buildDetailRow(
                      label: 'Phone No',
                      value: phoneNo,
                      editable: isEditing,
                    ),
                    _buildDetailRow(
                      label: 'Email Address',
                      value: emailAddress,
                      editable: isEditing,
                    ),
                    _buildDetailRow(
                      label: 'Description',
                      value: description,
                      editable: isEditing,
                    ),
                    // if (isEditing) ...[
                    //   SizedBox(height: 20.0),
                    //   ElevatedButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         isEditing = false;
                    //       });
                    //     },
                    //     child: Text('Update'),
                    //   ),
                    // ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isEditing) ...[
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isEditing = false;
                              });
                            },
                            child: Text('Update'),
                          ),
                        ],
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Add your button functionality here
                        //   },
                        //   child: Text('Update'),
                        // ),
                        SizedBox(width: 10.0), // Space between buttons
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trackingorder()),
                            );
                          },
                          child: Text('Status'),
                        ),
                      ],
                    ),
                    // SizedBox(height: 20.0),
                    // Container(
                    //   padding: EdgeInsets.all(40.0),
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey[200],
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SizedBox(height: 10.0),
                    //       Text(
                    //         'Details About the Customer requirements',
                    //         style: TextStyle(
                    //           fontSize: 16.0,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
      {required String label, required String value, required bool editable}) {
    TextEditingController controller = TextEditingController(text: value);
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          editable
              ? SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: TextFormField(
                    initialValue: value,
                    // controller: controller,
                    onChanged: (newValue) {
                      setState(() {
                        switch (label) {
                          case 'Site Name':
                            siteName = newValue;
                            break;
                          case 'Height':
                            height = newValue;
                            break;
                          case 'Width':
                            width = newValue;
                            break;
                          case 'Phone No':
                            phoneNo = newValue;
                            break;
                          case 'Email Address':
                            emailAddress = newValue;
                            break;
                          case 'Description':
                            description = newValue;
                            break;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              : Text(
                  value,
                  style: TextStyle(fontSize: 16.0),
                ),
        ],
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

void main() {
  runApp(MemoryContainer1());
}
