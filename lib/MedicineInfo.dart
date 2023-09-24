import 'package:flutter/material.dart';

class MedicineListScreen extends StatefulWidget {
  @override
  _MedicineListScreenState createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  List<String> medicines = [
    'Medicine A',
    'Medicine B',
    'Medicine C',
    'Medicine D',
    'Medicine E',
    // Add more medicines as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine List'),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(medicines[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the medicine when the delete icon is pressed
                setState(() {
                  medicines.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new medicine when the FloatingActionButton is pressed
          setState(() {
            medicines.add('New Medicine');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
