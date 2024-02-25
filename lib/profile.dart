import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> getImageFromCamera(bool isCamera) async {
    File? image;
    final picker = ImagePicker();
    if (isCamera) {
      final pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    }
    setState(() {
      _image = image;
    });
  }

  Future<void> saveProfileData() async {
    // Validate form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String? imageUrl;

    if (_image != null) {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${DateTime.now()}.png');
      firebase_storage.UploadTask uploadTask = ref.putFile(_image!);

      await uploadTask.whenComplete(() async {
        imageUrl = await ref.getDownloadURL();
      });
    }

    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'imageUrl': imageUrl ?? '',
      });
    } catch (e) {
      print('Error saving profile data: $e');
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text("Basic Info")),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                getImageFromCamera(true);
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: _image == null
                    ? Icon(
                  Icons.camera_alt,
                  size: 60,
                  color: Colors.grey[600],
                )
                    : ClipOval(
                  child: Image.file(
                    _image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveProfileData();
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
            )
          ],
        ),
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously
//
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   File? _image;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//   Future<void> getImageFromCamera(bool isCamera) async {
//     File? image;
//     final picker = ImagePicker();
//     if (isCamera) {
//       final pickedImage = await picker.pickImage(source: ImageSource.camera);
//       if (pickedImage != null) {
//         image = File(pickedImage.path);
//       }
//     }
//     setState(() {
//       _image = image;
//     });
//   }
//
//   Future<void> saveProfileData() async {
//     String name = _nameController.text.trim();
//     String email = _emailController.text.trim();
//     String? imageUrl;
//
//     if (_image != null) {
//       firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child('profile_images')
//           .child('${DateTime.now()}.png');
//       firebase_storage.UploadTask uploadTask = ref.putFile(_image!);
//
//       await uploadTask.whenComplete(() async {
//         imageUrl = await ref.getDownloadURL();
//       });
//     }
//
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     try {
//       await FirebaseFirestore.instance.collection('users').doc(uid).set({
//         'name': name,
//         'email': email,
//         'imageUrl': imageUrl ?? '',
//       });
//     } catch (e) {
//       print('Error saving profile data: $e');
//     }
//
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Basic Info")),
//       ),
//       body: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               getImageFromCamera(true);
//             },
//             child: Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.grey[300],
//               ),
//               child: _image == null
//                   ? Icon(
//                       Icons.camera_alt,
//                       size: 60,
//                       color: Colors.grey[600],
//                     )
//                   : ClipOval(
//                       child: Image(
//                       image: AssetImage('assets/images/Profile.jpg'),
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.cover,
//                     )),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
//             child: TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               saveProfileData();
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color.fromRGBO(82, 192, 152, 10),
//               foregroundColor: Colors.white,
//               padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: Text(
//               'Save',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
