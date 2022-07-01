import 'package:flutter/material.dart';

import '../../const/app_colors.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}

class SubHeading extends StatelessWidget {
  const SubHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.kLightGrey,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}
