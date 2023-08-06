import 'package:flutter/material.dart';
import 'package:movie_characters_app/src/config/theme/text_styles.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) => Text(
        errorMessage,
        style: AppTextStyles.errorMessageTextStyle,
      );
}
