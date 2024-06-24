import 'dart:io';
import 'package:e_nursury/controller/Plant_Controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AddPlantView extends StatefulWidget {
  final String shopId;

  AddPlantView({required this.shopId});

  @override
  _AddPlantViewState createState() => _AddPlantViewState();
}

class _AddPlantViewState extends State<AddPlantView> {
  PlantController _plantController = PlantController();
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _quantity = 0;
  double _price = 0.0;
  String _imageUrl = '';
  String _description = '';
  String _category = '';

  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Plant'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              getTextWidget('Plant Name', (value) => _name = value!, 'Please enter a plant name'),
              SizedBox(height: 10),
              getTextWidget('Quantity', (value) => _quantity = int.parse(value!), 'Please enter a valid quantity', TextInputType.number),
              SizedBox(height: 10),
              getTextWidget('Price', (value) => _price = double.parse(value!), 'Please enter a valid price', TextInputType.number),
              SizedBox(height: 10),
              getTextWidget('Description', (value) => _description = value!, null),
              SizedBox(height: 10),
              getDropDownWidget('Category', (value) => _category = value!, [
                'Indoor',
                'Outdoor',
                'Recommended',
              ]),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              SizedBox(height: 10),
              if (_imageUrl.isNotEmpty) _buildImageContainer(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await _plantController.addPlant(
                      widget.shopId,
                      _name,
                      _quantity,
                      _price,
                      _imageUrl,
                      _description,
                      _category,
                    ).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Plant added successfully')));
                      Navigator.pop(context);
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add plant: $error')));
                    });
                  }
                },
                child: Text('Add Plant'),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField getTextWidget(String label, Function(String?) onSave, String? validatorMessage, [TextInputType keyboardType = TextInputType.text]) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
      ),
      keyboardType: keyboardType,
      maxLines: null,
      validator: (value) {
        if (validatorMessage != null && (value == null || value.isEmpty)) {
          return validatorMessage;
        }
        return null;
      },
      onSaved: (value) => onSave(value),
    );
  }

  DropdownButtonFormField<String> getDropDownWidget(String label, Function(String?) onChange, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) => onChange(value),
      validator: (value) => value == null ? 'Field required' : null,
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        image: _imageFile != null
            ? DecorationImage(
          image: FileImage(_imageFile!),
          fit: BoxFit.cover,
        )
            : null,
      ),
    );
  }
}
