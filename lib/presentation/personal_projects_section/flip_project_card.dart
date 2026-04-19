import 'dart:math';
import 'package:flutter/material.dart';
import '../../domain/entities/project_entity.dart';
import 'project_card.dart';
import 'project_card_back.dart';

class FlipProjectCard extends StatefulWidget {
  final ProjectEntity project;

  const FlipProjectCard({required this.project, super.key});

  @override
  State<FlipProjectCard> createState() => _FlipProjectCardState();
}

class _FlipProjectCardState extends State<FlipProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
      if (_isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: () {
          // Позволяет переворачивать карточку по клику (актуально для планшетов)
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value;
            final isBack = angle >= pi / 2;

            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateY(angle),
              alignment: Alignment.center,
              child: isBack
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: ProjectCardBack(project: widget.project),
                    )
                  : ProjectCard(project: widget.project, showActions: true),
            );
          },
        ),
      ),
    );
  }
}
