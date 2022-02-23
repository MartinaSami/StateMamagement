import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../shared/app_colors.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final Function onPressed;
  final bool enabled;
  final Widget child;
  final Color color;
  final BoxDecoration decoration;
  const BusyButton({
    this.busy = false,
    required this.onPressed,
    this.enabled = true,
    required this.child,
    this.color = primaryColor,
    required this.decoration,
  });
  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: widget.decoration != null
          ? widget.decoration.borderRadius
          : BorderRadius.circular(15),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (widget.busy) return;

          widget.onPressed();
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: widget.decoration,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: widget.busy ? 10 : 25,
                vertical: widget.busy ? 10 : 10),
            child: !widget.busy
                ? widget.child
                : SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )),
      ),
    );
  }
}
