import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzakrakow/app/features/home_page/restaurants/cubit/restaurants_cubit.dart';

class RestaurantsPageContent extends StatelessWidget {
  const RestaurantsPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantsCubit()..start(),
      child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return const Center(child: Text('Coś poszło nie tak'));
          }
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          final documents = state.documents;
          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Dismissible(
                    key: ValueKey(document),
                    onDismissed: (_) {
                      // context
                      //     .read<RestaurantsCubit>()
                      //     .deleteRestautanst(document.id);
                      state.document;
                      // FirebaseFirestore.instance
                      //     .collection('restaurants')
                      //     .doc(document.id)
                      //     .delete();
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
        },
      ),
    );
  }
}
