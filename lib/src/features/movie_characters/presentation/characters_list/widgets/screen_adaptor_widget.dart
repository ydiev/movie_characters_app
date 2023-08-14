import 'package:flutter/material.dart';

class ScreenAdaptorWidget extends StatelessWidget {
  const ScreenAdaptorWidget({
    required this.portrait,
    required this.landscape,
    super.key,
  });

  final Widget portrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) =>
            orientation == Orientation.portrait ? portrait : landscape,
      );
}
