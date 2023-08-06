import 'package:flutter/material.dart';
import 'package:movie_characters_app/src/config/routing/app_router.dart';
import 'package:movie_characters_app/src/config/theme/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        routes: appRouter,
        title: 'Movie Characters Flutter App',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
      );
}
