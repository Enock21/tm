import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tm_front/utils/u_theme.dart';

class CVGMIcon extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const CVGMIcon({
    Key? key,
    this.width = 63,
    this.height = 63,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/book-opened-svgrepo-com.svg',
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(
        color ?? AppColors.nonInteractiveGreen,
        BlendMode.srcIn,
      ),
    );
  }
}
