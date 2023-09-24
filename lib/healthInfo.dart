import 'package:flutter/material.dart';

class HealthInfo extends StatelessWidget {
  final List<HealthData> healthDataList = [
    HealthData('Weight', '70 kg', Icons.add, Colors.black),
    HealthData('Heart Rate', '72 BPM', Icons.favorite, Colors.red),
    HealthData('Steps', '10,000 steps', Icons.directions_walk, Colors.blue),
    HealthData('Blood Pressure', '120/80 mmHg', Icons.local_hospital, Colors.green),
    HealthData('SPO2%', '99%', Icons.ac_unit_rounded, Colors.lightBlue)
    // Add more health data entries as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Data'),
      ),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns in the grid
        ),
        itemCount: healthDataList.length,
        itemBuilder: (BuildContext context, int index) {
          final data = healthDataList[index];
          return HealthDataCard(data: data);
        },
      )
    );
  }
}

class HealthData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  HealthData(this.title, this.value, this.icon, this.color);
}

class HealthDataCard extends StatelessWidget {
  final HealthData data;

  HealthDataCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              data.icon,
              size: 50.0,
              color: data.color,
            ),
            SizedBox(height: 8.0),
            Text(
              data.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              data.value,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
