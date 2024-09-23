import 'package:flutter/material.dart';
import 'package:ruqayyah/app.dart';
import 'package:ruqayyah/services.dart';

void main() async {
  await initServices();

  runApp(const MyApp());
}
