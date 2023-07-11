import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionContent extends StatefulWidget {
  const AddOpinionContent({
    super.key,
  });

  @override
  State<AddOpinionContent> createState() => _AddOpinionContentState();
}

class _AddOpinionContentState extends State<AddOpinionContent> {
  var rastaurantName = '';
  var pizzaName = '';
  var rating = 1.0;
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
              decoration: const InputDecoration(hintText: 'Naza restauracji'),
            ),
            TextField(
              onChanged: (newValue) {
                pizzaName = newValue;
              },
              decoration: const InputDecoration(hintText: 'Naza pizzy'),
            ),
            const SizedBox(
              height: 20,
            ),
            Slider(
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
              value: rating,
              min: 0.0,
              max: 10.0,
              divisions: 20,
              label: rating.toString(),
              activeColor: Colors.black,
            ),
            OutlinedButton(
              onPressed: rastaurantName.isEmpty || pizzaName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('restaurants').add({
                        'name': rastaurantName,
                        'pizza': pizzaName,
                        'rating': rating
                      });
                    },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
