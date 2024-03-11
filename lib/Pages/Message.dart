import 'package:flutter/material.dart';

// class Message extends StatefulWidget {
//   const Message({super.key});
//
//   @override
//   State<Message> createState() => _MessageState();
// }
//
// class _MessageState extends State<Message> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: <Widget>[Text("Message Page"), Raised],
//         ),
//       ),
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_ios),
//       ),
//     );
//   }
// }
class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
