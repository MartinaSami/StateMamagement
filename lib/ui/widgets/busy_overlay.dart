import 'package:flutter/material.dart';

/// A modal overlay that will show over your child widget (fullscreen) when the show value is true
///
/// Wrap your scaffold in this widget and set show value to model.isBusy to show a loading modal when
/// your model state is Busy
class BusyOverlay extends StatelessWidget {
  final Widget child;
  final String title;
  final bool show;

  const BusyOverlay(
      {required this.child, this.title = 'Please wait...', this.show = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: <Widget>[
          child,
          Positioned.fill(
            child: IgnorePointer(
              ignoring: !show,
              child: Opacity(
                  opacity: show ? 1.0 : 0.0,
                  child: Container(
                    // width: screenSize.width,
                    // height: screenSize.height,
                    alignment: Alignment.center,
                    color: Color.fromARGB(100, 0, 0, 0),
                    child: CircularProgressIndicator(),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
