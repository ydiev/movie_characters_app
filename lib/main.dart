import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_characters_app/src/app.dart';
import 'package:movie_characters_app/src/config/theme/app_colors.dart';
import 'package:movie_characters_app/src/dependency_register.dart';

void main() {
  registerDependencies();
  runApp(const App());
}

void registerErrorHandlers() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.error,
          title: const Text('An error occurred'),
        ),
        body: Center(
          child: Text(
            details.toString(),
          ),
        ),
      );
}
