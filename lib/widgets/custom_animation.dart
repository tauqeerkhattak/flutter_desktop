import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';

class CustomAnimation extends StatefulWidget {
  final Widget child;
  final double shadowSpreadRadius;
  final controller;
  final double singleShadowWidth;
  final ShadowType shadowType;

  const CustomAnimation({
    Key? key,
    required this.child,
    required this.controller,
    required this.shadowType,
    required this.singleShadowWidth,
    required this.shadowSpreadRadius,
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
        print(notification.direction);
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
                    width: SizeConfig.screenWidth,
                    child: FadeTransition(
                      opacity: topAnimation,
                      child: CustomShadow(
                        spreadRadius: widget.shadowSpreadRadius,
                        direction: VerticalDirection.down,
                        shadowType: widget.shadowType,
                        width: widget.singleShadowWidth,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: FadeTransition(
                opacity: bottomAnimation,
                child: CustomShadow(
                  spreadRadius: widget.shadowSpreadRadius,
                  direction: VerticalDirection.up,
                  shadowType: widget.shadowType,
                  width: widget.singleShadowWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
