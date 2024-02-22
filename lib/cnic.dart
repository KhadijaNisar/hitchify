// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CNIC extends StatefulWidget {
  const CNIC({Key? key}) : super(key: key);

  @override
  State<CNIC> createState() => _CNICPageState();
}

class _CNICPageState extends State<CNIC> {
  File? _frontImage;
  File? _backImage;
  final TextEditingController _cnicController = TextEditingController();

  // Future<void> getImage(bool isFront) async {
  //   File? image;
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     image = File(pickedImage.path);
  //     setState(() {
  //       if (isFront) {
  //         _frontImage = image;
  //       } else {
  //         _backImage = image;
  //       }
  //     });
  //   }
  // }
  Future<void> getImage(bool isFront) async {
    File? image;
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {
        if (isFront) {
          _frontImage = image;
        } else {
          _backImage = image;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CNIC')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.white,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'CNIC (Front Side)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      _frontImage == null
                          ? Placeholder(
                              fallbackWidth: 100,
                              fallbackHeight: 100,
                            ) // Placeholder for Image
                          : Image.file(
                              _frontImage!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ), // Display the image if available
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // saveProfileData();
                          getImage(1 as bool);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(82, 192, 152, 10),
                          foregroundColor: Colors.white,
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Add Photo',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ), // Add button for image selection
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.white,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'CNIC (Back Side)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      _frontImage == null
                          ? Placeholder(
                              fallbackWidth: 100,
                              fallbackHeight: 100,
                            ) // Placeholder for Image
                          : Image.file(
                              _backImage!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ), // Display the image if available
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          getImage(0 as bool);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(82, 192, 152, 10),
                          foregroundColor: Colors.white,
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Add Photo',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ), // Add button for image selection
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.all(8.0),
                color: Colors.white,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "CNIC",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: _cnicController,
                        decoration: InputDecoration(
                          hintText: 'Enter CNIC Number',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Change the border color when focused
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .grey), // Change the border color when not focused
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(82, 192, 152, 10),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
