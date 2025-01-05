import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Form with Dropdown')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GenderForm(),
        ),
      ),
    );
  }
}

class GenderForm extends StatefulWidget {
  @override
  _GenderFormState createState() => _GenderFormState();
}

class _GenderFormState extends State<GenderForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;

  final List<String> _genders = ['Male', 'Female'];

  // Form submission method
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, show a snackbar or process data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted Successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Gender Dropdown
          DropdownButtonFormField<String>(
            value: _selectedGender,
            hint: Text('Select Gender'),
            items: _genders.map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedGender = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a gender';
              }
              return null;
            },
          ),
          
          SizedBox(height: 20),

          // Submit Button
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
