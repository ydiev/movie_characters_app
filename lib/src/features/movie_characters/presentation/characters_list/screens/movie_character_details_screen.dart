import 'package:flutter/material.dart';

class MovieCharacterDetailsScreen extends StatelessWidget {
  const MovieCharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search',
        ),
        onChanged: (value) {
          print(value);
        },
      );
}
