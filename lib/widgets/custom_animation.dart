import 'package:flutter/material.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:get/get.dart';

class CustomAnimation extends StatefulWidget {
  final Widget child;
  final controller;
  final ShadowType shadowType;
  final double? shadowHeight;

  const CustomAnimation({
    Key? key,
    required this.child,
    required this.controller,
    required this.shadowType,
    this.shadowHeight,
  }) : super(key: key);

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with TickerProviderStateMixin {
  late AnimationController topAnimationController;
  late Animation<double> topAnimation;
  late AnimationController bottomAnimationController;
  late Animation<double> bottomAnimation;
  bool hasUserScrolled = false;

  @override
  void initState() {
    topAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    topAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: topAnimationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    bottomAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    bottomAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: bottomAnimationController,
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
          topAnimationController.forward();
        } else if (widget.controller.cWidth.value >= 0.02) {
          topAnimationController.reverse();
        }
        if (widget.controller.cWidth.value > 0.975) {
          bottomAnimationController.forward();
        } else if (widget.controller.cWidth.value <= 0.975) {
          bottomAnimationController.reverse();
        }
        return true;
      },
      child: Stack(
        children: [
          widget.child,
          hasUserScrolled
              ? Positioned(
                  top: -8,
                  child: SizedBox(
                    width: Get.width,
                    child: FadeTransition(
                      opacity: topAnimation,
                      child: CustomShadow(
                        shadowHeight: widget.shadowHeight,
                        direction: VerticalDirection.down,
                        shadowType: widget.shadowType,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: Get.width,
              child: FadeTransition(
                opacity: bottomAnimation,
                child: CustomShadow(
                  shadowHeight: widget.shadowHeight,
                  direction: VerticalDirection.up,
                  shadowType: widget.shadowType,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
