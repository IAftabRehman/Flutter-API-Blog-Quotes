import 'package:flutter/material.dart';

class MyGradientScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional? persistentFooterAlignment;
  final bool? resizeToAvoidBottomInset;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool? drawerEnableOpenDragGesture;
  final bool? endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Key? scaffoldKey;

  const MyGradientScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment,
    this.resizeToAvoidBottomInset,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture,
    this.endDrawerEnableOpenDragGesture,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFEFCFE),
            Color(0xfff7def6),
          ],
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        persistentFooterButtons: persistentFooterButtons,
        persistentFooterAlignment: persistentFooterAlignment ?? AlignmentDirectional.centerEnd,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        drawer: drawer,
        onDrawerChanged: onDrawerChanged,
        endDrawer: endDrawer,
        onEndDrawerChanged: onEndDrawerChanged,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture ?? true,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
      ),
    );
  }
}
