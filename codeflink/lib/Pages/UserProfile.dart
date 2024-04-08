import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  File? _image;
  bool _inEditMode = false; // Flag to track whether in edit mode

  @override
  void initState() {
    super.initState();
    // Set default values
    _nameController.text = 'Mathan';
    _emailController.text = 'mathan@gmail.com';
    _addressController.text = 'Suchindrum';
    _cityController.text = 'NagerCoil';
    _districtController.text = 'Kanyakumari';
    _stateController.text = 'Tamilnadu';
    _mobileController.text = '8870469532';
    _positionController.text = 'Designer';
  }

  // Function to handle when the user selects an image
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to enter edit mode
  void _enterEditMode() {
    setState(() {
      _inEditMode = true;
    });
  }

  // Function to save the user profile
  void _saveProfile() {
    // Exit edit mode
    setState(() {
      _inEditMode = false;
    });
    // Implement your logic for updating the profile
    // You can access the values of the fields using respective controller.text
    String name = _nameController.text;
    String mobile = _mobileController.text;
    String address = _addressController.text;
    String city = _cityController.text;
    String district = _districtController.text;
    String state = _stateController.text;
    String email = _emailController.text;
    String position = _positionController.text;
    // Perform actions to save/update the profile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _inEditMode = !_inEditMode;
              });
            },
            icon: Icon(_inEditMode ? Icons.check : Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage, // Call _pickImage function when tapped
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.grey[600],
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildEditableTextField(
                controller: _nameController,
                labelText: 'Name',
              ),
              SizedBox(height: 10),
              _buildEditableTextField(
                controller: _mobileController,
                labelText: 'Mobile Number',
              ),
              SizedBox(height: 10),
              _buildEditableTextField(
                controller: _emailController,
                labelText: 'Email',
              ),
              SizedBox(height: 10),
              _buildEditableTextField(
                controller: _positionController,
                labelText: 'Position',
              ),
              SizedBox(height: 10),
              _buildEditableTextField(
                controller: _addressController,
                labelText: 'Address',
              ),
              SizedBox(height: 10),
              _buildEditableTextField(
                controller: _cityController,
                labelText: 'City',
              ),
              SizedBox(height: 10),
              _buildEditableTextField(
                controller: _districtController,
                labelText: 'District',
              ),
              SizedBox(height: 10),
              _buildEditableTextField(
                controller: _stateController,
                labelText: 'State',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _inEditMode ? _saveProfile : null,
                  child: Text('Update'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build editable text field
  Widget _buildEditableTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      style: TextStyle(fontSize: 16),
      enabled: _inEditMode,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserProfile(),
  ));
}
