import 'package:flutter/material.dart';

class StudentDetailsPage extends StatelessWidget {
  final dynamic item;

  StudentDetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    // Implement your UI for student details using 'item'
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Column(
        children: [
            Text('Student Name: ${item['name']}'),
            Text('Student Username: ${item['username']}'),
            Text('Email: ${item['email']}')
        ],
      ),
    );
  }
}
