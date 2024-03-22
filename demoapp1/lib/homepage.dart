import 'package:flutter/material.dart';
import 'package:demoapp1/APIService.dart'; // Replace with your file path
import 'dart:convert'; // Import the dart:convert package
import 'package:demoapp1/studentdetails.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService('https://jsonplaceholder.typicode.com/'); // Replace with your API endpoint

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter REST API Example'),
        ),
        body: FutureBuilder(
          future: apiService.fetchData('users'), // Replace 'endpoint' with the specific API endpoint you want to call
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Parse the JSON data and display it
              final data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle item click here
                      _handleItemClick(context, data[index]);
                    },
                    child: ListTile(
                      title: Text(data[index]['name']),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void _handleItemClick(BuildContext context, dynamic item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailsPage(item: item), // Pass the item to the detail page
      ),
    );
  }
}
