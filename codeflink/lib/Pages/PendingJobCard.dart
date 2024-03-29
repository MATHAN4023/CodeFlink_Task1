import 'package:flutter/material.dart';

class PendingJobCard extends StatefulWidget {
  @override
  _PendingJobCardState createState() => _PendingJobCardState();
}

class _PendingJobCardState extends State<PendingJobCard> {
  List<String> tasks = [];

  TextEditingController taskController = TextEditingController();
    List<String> orderStatus = [
    "Order Placed",
    "Processing",
    "Shipped",
    "Out for Delivery",
    "Delivered"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Tracking'),
      ),
      body: ListView.builder(
        itemCount: orderStatus.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
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
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Your order is ${index == orderStatus.length - 1 ? 'complete' : 'in progress'}",
                    style: TextStyle(
                      fontSize: 16.0,
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
                        ),
                      ),
                      Text(
                        index == orderStatus.length - 1
                            ? "Delivered"
                            : "5 days",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PendingJobCard(),
  ));
}
