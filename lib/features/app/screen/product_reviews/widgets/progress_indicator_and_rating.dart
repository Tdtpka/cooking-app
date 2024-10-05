import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {

  final String text;
  final double value;
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: Theme.of(context).textTheme.bodyMedium,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey.withOpacity(0.15),
              valueColor: const AlwaysStoppedAnimation(Colors.amber),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}