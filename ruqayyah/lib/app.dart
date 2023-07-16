import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ruqayyah/src/shared/functions/app_print.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Ruqayyah"),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.short_text, title: 'موجزة'),
          TabItem(icon: Icons.short_text, title: 'متوسطة'),
          TabItem(icon: Icons.short_text, title: 'مطولة'),
        ],
        onTap: (int i) => appPrint('click index=$i'),
      ),
    );
  }
}
