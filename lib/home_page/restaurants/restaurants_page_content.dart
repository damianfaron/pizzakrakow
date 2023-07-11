import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantsPageContent extends StatelessWidget {
  const RestaurantsPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('restaurants')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Coś poszło nie tak'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Trwa ładowanie danych'));
          }
          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Dismissible(
                    key: ValueKey(document),
                    onDismissed: (_) {
                      FirebaseFirestore.instance
                          .collection('restaurants')
                          .doc(document.id)
                          .delete();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              document['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              document['pizza'],
                            ),
                          ],
                        ),
                        Text(document['rating'].toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        });
  }
}
