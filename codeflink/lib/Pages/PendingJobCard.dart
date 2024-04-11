import 'package:codeflink/Pages/AcceptedJobCardsPage.dart';
import 'package:codeflink/Pages/DesigningJobCardsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PendingJobCard(),
  ));
}

class PendingJobCard extends StatefulWidget {
  @override
  _PendingJobCardState createState() => _PendingJobCardState();
}

class _PendingJobCardState extends State<PendingJobCard> {
  List<String> orderStatus = [
    "Accepted Cards",
    "Designing Cards",
    "Customer Acceptance",
    "Printing Cards",
    "Delivered"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Job Cards'),
      ),
      body: ListView.builder(
        itemCount: orderStatus.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to different pages based on the clicked item
              switch (orderStatus[index]) {
                case "Accepted Cards":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AcceptedJobCardsPage()),
                  );
                  break;
                case "Designing Cards":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DesigningJobCardsPage()),
                  );
                  break;
                // Add cases for other statuses if needed
                default:
                  // Do nothing for other statuses
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderStatus[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Estimated Delivery:",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          index == orderStatus.length - 1 ? "Delivered" : "5 days",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AcceptedCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accepted Cards Page"),
      ),
      body: Center(
        child: Text("Accepted Cards Page"),
      ),
    );
  }
}

class DesigningCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Designing Cards Page"),
      ),
      body: Center(
        child: Text("Designing Cards Page"),
      ),
    );
  }
}
