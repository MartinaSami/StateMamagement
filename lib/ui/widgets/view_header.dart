import "package:flutter/material.dart";

import '../shared/app_colors.dart';
import 'clip_shadow_path.dart';

class ViewHeader extends StatelessWidget {
  final Widget child;
  final double height;
  final LinearGradient color;
  ViewHeader(
      {required this.child,
      required this.height,
      this.color = viewHeaderGradient});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeInOutCirc,
      duration: Duration(milliseconds: 2000),
      builder: (ctx, v, _) => ClipShadowPath(
        shadow: BoxShadow(
          blurRadius: 3,
          color: Colors.black38,
          spreadRadius: 1,
          offset: Offset(1, 3),
        ),
        clipper: _ViewHeaderClipper(
          animationValue: v,
          height: height,
          width: media.size.width,
        ),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
              // color: Colors.green,
              gradient: this.color),
          child: this.child,
        ),
      ),
    );
  }
}

class _ViewHeaderClipper extends CustomClipper<Path> {
  final animationValue;
  final double height;
  final double width;
  _ViewHeaderClipper(
      {this.animationValue, required this.height, required this.width});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / this.width;
    final double _yScaling = size.height / 350 * animationValue;
    // path.lineTo(-100.617 * _xScaling, 87.7605 * _yScaling);
    // path.cubicTo(
    //   -121.24 * _xScaling,
    //   114.186 * _yScaling,
    //   -127.649 * _xScaling,
    //   147.307 * _yScaling,
    //   -117.587 * _xScaling,
    //   175.341 * _yScaling,
    // );
    path.cubicTo(
      -103.381 * _xScaling,
      214.885 * _yScaling,
      -62.5469 * _xScaling,
      234.72 * _yScaling,
      -15.0605 * _xScaling,
      240.262 * _yScaling,
    );
    path.cubicTo(
      2.32587 * _xScaling,
      242.298 * _yScaling,
      20.1865 * _xScaling,
      242.952 * _yScaling,
      36.9645 * _xScaling,
      246.735 * _yScaling,
    );
    path.cubicTo(
      77.4661 * _xScaling,
      255.873 * _yScaling,
      // 1
      83.6326 * _xScaling,
      285.499 * _yScaling,
      107.479 * _xScaling,
      309.604 * _yScaling,
    );
    path.cubicTo(
      // 2
      171.695 * _xScaling,
      374.552 * _yScaling,
      278.587 * _xScaling,
      286.003 * _yScaling,
      358.472 * _xScaling,
      283.851 * _yScaling,
    );
    path.cubicTo(
      410.457 * _xScaling,
      282.449 * _yScaling,
      454.839 * _xScaling,
      311.258 * _yScaling,
      467.595 * _xScaling,
      352.006 * _yScaling,
    );
    path.cubicTo(
      468.51 * _xScaling,
      354.928 * _yScaling,
      469.361 * _xScaling,
      358.039 * _yScaling,
      471.858 * _xScaling,
      360.13 * _yScaling,
    );
    path.cubicTo(
      473.584 * _xScaling,
      361.564 * _yScaling,
      475.934 * _xScaling,
      362.361 * _yScaling,
      478.275 * _xScaling,
      363.004 * _yScaling,
    );
    path.cubicTo(
      514.848 * _xScaling,
      373.116 * _yScaling,
      560.499 * _xScaling,
      353.515 * _yScaling,
      583.338 * _xScaling,
      326.026 * _yScaling,
    );
    path.cubicTo(
      608.59 * _xScaling,
      295.616 * _yScaling,
      613.764 * _xScaling,
      257.887 * _yScaling,
      613.365 * _xScaling,
      222.655 * _yScaling,
    );
    path.cubicTo(
      613.05 * _xScaling,
      194.534 * _yScaling,
      609.579 * _xScaling,
      166.13 * _yScaling,
      595.834 * _xScaling,
      141.591 * _yScaling,
    );
    // path.cubicTo(
    //   558.544 * _xScaling,
    //   74.9784 * _yScaling,
    //   458.122 * _xScaling,
    //   53.8164 * _yScaling,
    //   403.44 * _xScaling,
    //   -2.80561 * _yScaling,
    // );
    path.cubicTo(
      391.634 * _xScaling,
      -15.0385 * _yScaling,
      382.038 * _xScaling,
      -28.8511 * _yScaling,
      368.913 * _xScaling,
      -40.0722 * _yScaling,
    );
    path.cubicTo(
      335.536 * _xScaling,
      -68.6002 * _yScaling,
      283.613 * _xScaling,
      -76.7941 * _yScaling,
      233.758 * _xScaling,
      -77.7029 * _yScaling,
    );
    path.cubicTo(
      172.288 * _xScaling,
      -78.8232 * _yScaling,
      106.1 * _xScaling,
      -69.4919 * _yScaling,
      54.6492 * _xScaling,
      -36.3114 * _yScaling,
    );
    // path.cubicTo(
    //   21.6932 * _xScaling,
    //   -15.0636 * _yScaling,
    //   -2.96631 * _xScaling,
    //   14.5285 * _yScaling,
    //   -36.3106 * _xScaling,
    //   35.316 * _yScaling,
    // );
    // path.cubicTo(
    //   -59.5288 * _xScaling,
    //   49.8312 * _yScaling,
    //   -84.8 * _xScaling,
    //   67.4992 * _yScaling,
    //   -100.617 * _xScaling,
    //   87.7605 * _yScaling,
    // );
    // path.cubicTo(
    //   -100.617 * _xScaling,
    //   87.7605 * _yScaling,
    //   -100.617 * _xScaling,
    //   87.7605 * _yScaling,
    //   -100.617 * _xScaling,
    //   87.7605 * _yScaling,
    // );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
