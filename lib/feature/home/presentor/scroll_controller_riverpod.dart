import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollProvider = Provider((ref) => ScrollControllerManager());

class ScrollControllerManager {
  final ScrollController scrollController = ScrollController();
  
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey portfolioKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  void dispose() {
    scrollController.dispose();
  }
}
