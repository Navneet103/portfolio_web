import 'dart:math';
import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';
import '../responsive/responsive.dart';

/// A high-performance interactive Vanta-style constellation background.
/// Driven by a CustomPainter to achieve consistent 60 FPS without widget rebuilds.
class VantaBackground extends StatefulWidget {
  const VantaBackground({super.key});

  @override
  State<VantaBackground> createState() => _VantaBackgroundState();
}

class _VantaBackgroundState extends State<VantaBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();
  Offset _mousePos = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Initialize particles after the first frame to get screen size
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initParticles();
    });
  }

  void _initParticles() {
    if (!mounted) return;
    final size = MediaQuery.sizeOf(context);
    final isMobile = Responsive.isMobile(context);
    
    // Throttle particle count for mobile performance
    final count = isMobile ? 35 : 100;

    _particles.clear();
    for (int i = 0; i < count; i++) {
      _particles.add(Particle(
        pos: Offset(
          _random.nextDouble() * size.width,
          _random.nextDouble() * size.height,
        ),
        vel: Offset(
          (_random.nextDouble() - 0.5) * 0.5,
          (_random.nextDouble() - 0.5) * 0.5,
        ),
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      // Disable cursor tracking on mobile to prevent gesture conflicts
      onHover: isMobile ? null : (event) => setState(() => _mousePos = event.localPosition),
      child: IgnorePointer(
        child: CustomPaint(
          size: Size.infinite,
          painter: ConstellationPainter(
            particles: _particles,
            mousePos: _mousePos,
            isMobile: isMobile,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

class Particle {
  Offset pos;
  Offset vel;

  Particle({required this.pos, required this.vel});

  void update(Size size) {
    pos += vel;
    if (pos.dx < 0 || pos.dx > size.width) vel = Offset(-vel.dx, vel.dy);
    if (pos.dy < 0 || pos.dy > size.height) vel = Offset(vel.dx, -vel.dy);
  }
}

class ConstellationPainter extends CustomPainter {
  final List<Particle> particles;
  final Offset mousePos;
  final bool isMobile;
  final AnimationController controller;

  ConstellationPainter({
    required this.particles,
    required this.mousePos,
    required this.isMobile,
    required this.controller,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.15)
      ..strokeWidth = 0.8;

    final dotPaint = Paint()..color = AppColors.primary.withOpacity(0.3);

    for (int i = 0; i < particles.length; i++) {
      final p = particles[i];
      p.update(size);

      // Desktop: Cursor tracking interaction
      if (!isMobile) {
        final mouseDist = (p.pos - mousePos).distance;
        if (mouseDist < 200) {
          final opacity = (1 - mouseDist / 200) * 0.2;
          paint.color = AppColors.secondary.withOpacity(opacity);
          canvas.drawLine(p.pos, mousePos, paint);
        }
      }

      // Proximity-based gradient connections
      for (int j = i + 1; j < particles.length; j++) {
        final p2 = particles[j];
        final dist = (p.pos - p2.pos).distance;
        final limit = isMobile ? 100 : 160;

        if (dist < limit) {
          final opacity = (1 - dist / limit) * 0.12;
          paint.color = AppColors.primary.withOpacity(opacity);
          canvas.drawLine(p.pos, p2.pos, paint);
        }
      }

      canvas.drawCircle(p.pos, 1.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant ConstellationPainter oldDelegate) => true;
}
