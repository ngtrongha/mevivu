import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen(
      {super.key, this.bgColor = const Color.fromARGB(255, 0, 0, 0)});
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const LoadingWidget(),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingIndicator(
        indicatorType: Indicator.ballClipRotateMultiple,
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary
        ],
        strokeWidth: 2,
      ),
    );
  }
}
