import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionContent extends StatefulWidget {
  const AddOpinionContent({
    super.key,
  });

  @override
  State<AddOpinionContent> createState() => _AddOpinionContentState();
}

var rastaurantName = '';
var pizzaName = '';

class _AddOpinionContentState extends State<AddOpinionContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (newValue) {
                rastaurantName = newValue;
              },
              decoration: InputDecoration(hintText: 'Naza restauracji'),
            ),
            TextField(
              onChanged: (newValue) {
                pizzaName = newValue;
              },
              decoration: InputDecoration(hintText: 'Naza pizzy'),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('restaurants').add({
                  'name': rastaurantName,
                  'pizza': pizzaName,
                  'rating': 3.0
                });
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
