import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pizzakrakow/app/app.dart';

import 'package:pizzakrakow/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
