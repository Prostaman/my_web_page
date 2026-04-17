import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GithubIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const GithubIcon({super.key, required this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/social/github_icon.svg',
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
