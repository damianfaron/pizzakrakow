
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizzakrakow/home_page/add_opinion/add_opinion_page_content.dart';
import 'package:pizzakrakow/home_page/my_account/my_account_page_content.dart';
import 'package:pizzakrakow/home_page/restaurants/restaurants_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          if (currenIndex == 1) {
            return const Text('Dodaj swoją pizzę');
          }
          if (currenIndex == 2) {
            return const Text('Twój profil');
          }
          return const Text(
            'Najlepsza Pizza w Krakowie',
          );
        }),
      ),
      body: Builder(builder: (context) {
        if (currenIndex == 0) {
          return const RestaurantsPageContent();
        }
        if (currenIndex == 1) {
          return const AddOpinionContent();
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenIndex,
        onTap: (newIndex) {
          setState(() {
            currenIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
