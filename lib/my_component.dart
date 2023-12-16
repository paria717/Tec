import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      endIndent: size.width / 6,
      thickness: 1,
      indent: size.width / 6,
    );
  }
}
