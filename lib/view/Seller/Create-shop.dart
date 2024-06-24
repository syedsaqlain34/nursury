import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_nursury/controller/Shop-Controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateShopView extends StatefulWidget {
  @override
  _CreateShopViewState createState() => _CreateShopViewState();
}

class _CreateShopViewState extends State<CreateShopView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final ShopController _shopController = ShopController();
  // Replace with the actual location picker logic
  GeoPoint _shopLocation = GeoPoint(0, 0);

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Shop Name'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Shop Image URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
            _image != null ? Image.file(_image!) : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Call createShop method
                await _shopController.createShop(
                  _nameController.text,
                  _imageUrlController.text,
                  _shopLocation,
                  [],
                );
                Navigator.pop(context);
              },
              child: Text('Create Shop'),
            ),
          ],
        ),
      ),
    );
  }
}
