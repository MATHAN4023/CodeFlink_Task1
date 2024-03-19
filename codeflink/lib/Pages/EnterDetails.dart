import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({Key? key}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  late DateTime selectedDate = DateTime.now();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Today Date: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: siteNameController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Site Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: heightController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: widthController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Width',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: phoneNumberController,
              onChanged: (_) => _updateButtonState(),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: emailController,
              onChanged: (_) => _updateButtonState(),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: descriptionController,
              onChanged: (_) => _updateButtonState(),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _allFieldsFilled ? _submit : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool get _allFieldsFilled {
    return siteNameController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        widthController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }

  void _submit() {
    // Implement your submit logic here
    print('Submit Button Pressed');
  }
}

void main() {
  runApp(MaterialApp(
    home: EnterDetails(),
  ));
}
