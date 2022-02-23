import "dart:ui" as ui;

import 'package:animations/animations.dart';
import "package:flutter/material.dart";
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      //onModelReady: (model) => model.modelReady(),
      builder: (context, HomeViewModel model, _) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xff550002),
          // endDrawer: AppDrawer(),
          appBar: AppBar(
            backgroundColor: Color(0xff780003),
            centerTitle: true,
            title: Image.asset(
              "assets/images/wqfkwnqfwnqiwf.png",
              height: 40,
              width: 40,
            ),
            titleSpacing: 0,
            elevation: 2,
            leading: IconButton(
              icon: Icon(Icons.notifications_none),
              color: Colors.white,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  // scaffoldKey.currentState.openEndDrawer();
                },
              ),
            ],
          ),
          extendBody: true,
          body: Container(
            padding: EdgeInsets.only(bottom: 50),
            child: PageTransitionSwitcher(
              duration: Duration(milliseconds: 300),
              //reverse: model.reverse,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) =>
                  SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
                transitionType: SharedAxisTransitionType.horizontal,
              ),
              // child: getCurrentView(model.currentIndex),
            ),
          ),
          bottomNavigationBar: Container(
            color:
                model.currentIndex == 1 ? Color(0xffF0F0F0) : Color(0xffF0F0F0),
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // model.setIndex(0);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: model.currentIndex == 0
                              ? Color(0xff550002)
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(15)),
                          boxShadow: model.currentIndex == 0
                              ? [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5,
                                      offset: Offset(2, 2))
                                ]
                              : []),
                      child: Icon(
                        Icons.live_tv_rounded,
                        color: model.currentIndex == 0
                            ? Colors.white
                            : Color(0xff550002),
                        size: 36,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // model.setIndex(1);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: model.currentIndex == 1
                              ? Color(0xff550002)
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15)),
                          boxShadow: model.currentIndex == 1
                              ? [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5,
                                      offset: Offset(2, 2))
                                ]
                              : []),
                      child: Icon(
                        Icons.home_outlined,
                        color: model.currentIndex == 1
                            ? Colors.white
                            : Color(0xff550002),
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      // ..color = Color(0xff964B00)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    // Hanafy Colors
    // paint_0.shader = ui.Gradient.linear(
    //     Offset(size.width, -0.0),
    //     Offset(size.width, size.height),
    //     [Color(0xffC27B0F), Color(0xffE48E0F).withOpacity(0.53)],
    //     [0.00, 1.00]);

    paint_0.shader = ui.Gradient.linear(
        Offset(size.width, -0.0),
        Offset(size.width, size.height),
        [Color(0xff851CFE), Color(0xffA15CF1).withOpacity(0.53)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.quadraticBezierTo(
        size.width * 1.00, size.height * 0.52, size.width, size.height * 0.35);
    // 1
    path_0.cubicTo(
      size.width * 0.92,
      size.height * 0.35,
      size.width * 0.92,
      size.height * 0.05,
      // 0
      size.width * 0.83,
      size.height * 0.05,
    );
    path_0.cubicTo(size.width * 0.75, size.height * 0.05, size.width * 0.75,
        size.height * 0.35, size.width * 0.67, size.height * 0.35);
    path_0.cubicTo(size.width * 0.58, size.height * 0.35, size.width * 0.59,
        size.height * 0.06, size.width * 0.50, size.height * 0.05);
    path_0.cubicTo(size.width * 0.42, size.height * 0.06, size.width * 0.42,
        size.height * 0.35, size.width * 0.33, size.height * 0.35);
    path_0.cubicTo(size.width * 0.25, size.height * 0.35, size.width * 0.25,
        size.height * 0.06, size.width * 0.17, size.height * 0.05);
    path_0.cubicTo(size.width * 0.08, size.height * 0.06, size.width * 0.08,
        size.height * 0.35, 0, size.height * 0.35);
    path_0.quadraticBezierTo(0, size.height * 0.53, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
