import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroSectionAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController scrollController;
  late Animation<double> scrollAnimation;

  final List<String> techStack = [
    'Flutter',
    'Dart',
    'HTML',
    'CSS',
    'Tailwind CSS',
    'JavaScript',
    'React JS',
    'Python',
  ];

  @override
  void onInit() {
    super.onInit();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    scrollController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    scrollAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: scrollController, curve: Curves.linear));
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void restartAnimation() {
    scrollController.reset();
    scrollController.repeat();
  }

  void pauseAnimation() {
    scrollController.stop();
  }

  void resumeAnimation() {
    scrollController.repeat();
  }
}
