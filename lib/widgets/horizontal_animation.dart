import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/list_switch_controller.dart';
import 'package:flutter_desktop/widgets/horizontal_shadow.dart';

class HorizontalAnimation extends StatefulWidget {
  final Widget child;
  final ListSwitchController controller;
  final double? shadowWidth;

  const HorizontalAnimation({
    Key? key,
    required this.child,
    required this.controller,
    this.shadowWidth,
  }) : super(key: key);

  @override
  State<HorizontalAnimation> createState() => _HorizontalAnimationState();
}

class _HorizontalAnimationState extends State<HorizontalAnimation>
    with TickerProviderStateMixin {
  late AnimationController leftAnimationController;
  late Animation<double> leftAnimation;
  late AnimationController rightAnimationController;
  late Animation<double> rightAnimation;
  bool hasUserScrolled = false;

  @override
  void initState() {
    leftAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    leftAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: leftAnimationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    rightAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    rightAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: rightAnimationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (!hasUserScrolled) {
          setState(() {
            hasUserScrolled = true;
          });
        }
        widget.controller.cWidth.value =
            widget.controller.scrollController.offset /
                widget.controller.scrollController.position.maxScrollExtent;
        if (widget.controller.cWidth.value < 0.025) {
          leftAnimationController.forward();
        } else if (widget.controller.cWidth.value >= 0.02) {
          leftAnimationController.reverse();
        }
        if (widget.controller.cWidth.value > 0.975) {
          rightAnimationController.forward();
        } else if (widget.controller.cWidth.value <= 0.975) {
          rightAnimationController.reverse();
        }
        return true;
      },
      child: Stack(
        children: [
          widget.child,
          if (hasUserScrolled)
            Positioned(
              left: -8,
              child: FadeTransition(
                opacity: leftAnimation,
                child: HorizontalShadow(
                  shadowWidth: widget.shadowWidth,
                  direction: Direction.left,
                ),
              ),
            ),
          Positioned(
            right: -8,
            child: FadeTransition(
              opacity: rightAnimation,
              child: HorizontalShadow(
                shadowWidth: widget.shadowWidth,
                direction: Direction.right,
              ),
            ),
          )
        ],
      ),
    );
  }
}
