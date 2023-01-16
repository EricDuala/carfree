// ignore_for_file: library_private_types_in_public_api, unnecessary_new, duplicate_ignore

import 'dart:async';
import 'package:flutter/material.dart';

class BlinkingToast {
  bool _isVisible = false;

  Duration? get duration => null;

  get position => null;

  ///
  /// BuildContext context: le contexte à partir duquel nous devons retrouver l'Overlay
  /// WidgetBuilder externalBuilder: (obligatoire) routine externe pour créer le Widget à afficher
  /// Duration duration: (optionnel) durée au bout de laquelle le Widget sera retiré
  /// Offset position: (optionnel) position où vous voulez afficher le widget
  ///
  void show({
    BuildContext? context,
    externalBuilder = const Icon(Icons.warning, color: Colors.purple),
    Duration duration = const Duration(seconds: 5),
    Offset position = const Offset(0, 50.0),
    // ignore: duplicate_ignore
  }) async {
    // Empêcher d'afficher plusieurs widgets en même temps
    if (_isVisible) {
      return;
    }

    _isVisible = true;

    OverlayState? overlayState = Overlay.of(context!);
    // ignore: unnecessary_new
    OverlayEntry overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => BlinkingToastWidget(
        widget: externalBuilder(context),
        position: position,
        key: null,
      ),
    );
    overlayState?.insert(overlayEntry);

    await Future.delayed(duration);

    overlayEntry.remove();

    _isVisible = false;
  }
}

class BlinkingToastWidget extends StatefulWidget {
  const BlinkingToastWidget({
    Key? key,
    required this.widget,
    required this.position,
  }) : super(key: key);

  final Widget widget;
  final Offset position;

  @override
  _BlinkingToastWidgetState createState() => _BlinkingToastWidgetState();
}

class _BlinkingToastWidgetState extends State<BlinkingToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
        parent: _controller, curve: const Interval(0.0, 0.5)))
      ..addListener(() {
        if (mounted) {
          setState(() {
            // Refresh
          });
        }
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse().orCancel;
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward().orCancel;
        }
      });
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: widget.position.dy,
        left: widget.position.dx,
        child: new IgnorePointer(
          child: new Material(
            color: Colors.transparent,
            child: new Opacity(
              opacity: _animation.value,
              child: widget.widget,
            ),
          ),
        ));
  }
}
