import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'CourseModel.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({Key ? key}) : super(key: key);

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _numClassesController = TextEditingController();
  final TextEditingController _timePerClassController = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();

  File? _imageFile;
  late FirebaseStorage storage;
  late FirebaseFirestore firestore;

  @override
  void initState() {
    super.initState();
    storage = FirebaseStorage.instance;
    firestore = FirebaseFirestore.instance;
  }

  Future<void> addCourse() async {
    if (_formKey.currentState!.validate()) {
      String courseName = _courseNameController.text;
      double price = double.parse(_priceController.text);
      int numClasses = int.parse(_numClassesController.text);
      double timePerClass = double.parse(_timePerClassController.text);
      int seatsAvailable = int.parse(_seatsController.text);

      File? imageFile = _imageFile;
      try {
        String? imageUrl;
        if (imageFile != null) {
          String imagePath = 'product_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
          Reference storageRef = storage.ref().child(imagePath);
          UploadTask uploadTask = storageRef.putFile(imageFile);
          await uploadTask.whenComplete(() => null);
          imageUrl = await storageRef.getDownloadURL();
        }

        Course newCourse = Course(
          courseName: courseName,
          price: price,
          numClasses: numClasses,
          timePerClass: timePerClass,
          seatsAvailable: seatsAvailable,
          imageUrl: imageUrl,
        );

        // Save the course data to Firestore
        CollectionReference collectionReference = firestore.collection('courses');
        await collectionReference.add({
          'coursename': newCourse.courseName,
          'price': newCourse.price,
          'noclasses': newCourse.numClasses,
          'timeperclass': newCourse.timePerClass,
          'seats': newCourse.seatsAvailable,
          'imageUrl': newCourse.imageUrl,
        });

        print('Course saved successfully');
      } catch (e) {
        print('Error saving course: $e');
      }
    }
  }


  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.add),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _courseNameController,
                decoration: InputDecoration(labelText: 'Course Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the course name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numClassesController,
                decoration: InputDecoration(labelText: 'Number of Classes'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the number of classes';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _timePerClassController,
                decoration: InputDecoration(labelText: 'Time per Class (hours)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the time per class';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _seatsController,
                decoration: InputDecoration(labelText: 'Seats Available'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the number of seats available';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addCourse();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
