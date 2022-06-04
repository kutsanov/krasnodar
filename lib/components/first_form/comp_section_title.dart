import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompSectionTitle extends StatelessWidget {
  const CompSectionTitle({Key? key, required this.title, this.icon})
      : super(key: key);

  final String title;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            if (icon != null) SvgPicture.asset(icon!),
            if (icon != null)
              SizedBox(
                width: 5,
              ),
            Text(title),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
