import 'package:flutter/material.dart';
import 'package:your_wellbeing/mongodb.dart';
class FamilyMember {
  final String name;
  final int age;
  FamilyMember({required this.name, required this.age});
}

class familyInfo extends StatelessWidget {
  final List<FamilyMember> familyMembers = [
    FamilyMember(name: 'John', age: 30),
    FamilyMember(name: 'Jane', age: 28),
    FamilyMember(name: 'Alice', age: 6),
    FamilyMember(name: 'Bob', age: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Members List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Family Members List'),

        ),
        body: FamilyMemberList(
          familyMembers: familyMembers,
        ),
      ),
    );
  }
}

class FamilyMemberList extends StatelessWidget {
  final List<FamilyMember> familyMembers;

  FamilyMemberList({required this.familyMembers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: familyMembers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(familyMembers[index].name),
          subtitle: Text('Age: ${familyMembers[index].age}'),
          onTap: () {
            _showFamilyMemberDetails(context, familyMembers[index]);
          },
        );
      },
    );
  }

  void _showFamilyMemberDetails(BuildContext context, FamilyMember member) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Details for ${member.name}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text('Name: ${member.name}'),
              Text('Age: ${member.age}'),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
