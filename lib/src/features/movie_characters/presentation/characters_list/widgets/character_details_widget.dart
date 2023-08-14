import 'package:flutter/material.dart';

class CharacterDetailsWidget extends StatelessWidget {
  const CharacterDetailsWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Center(
        child: Text(title),
      );
}
