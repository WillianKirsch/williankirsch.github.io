import 'package:flutter/material.dart';
import 'package:williankirsch/src/settings/settings_controller.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final ValueChanged<bool> onChanged;
  final SettingsController controller;

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    AlignmentTween(
            begin: widget.controller.isLightTheme
                ? Alignment.centerRight
                : Alignment.centerLeft,
            end: widget.controller.isLightTheme
                ? Alignment.centerLeft
                : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (widget.controller.isLightTheme) {
              _animationController.forward();
              widget.onChanged(false);
            } else {
              _animationController.reverse();
              widget.onChanged(true);
            }
          },
          child: Container(
            width: 50.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: widget.controller.isLightTheme
                  ? Colors.grey[100]
                  : Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment: widget.controller.isLightTheme
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Icon(
                    widget.controller.isLightTheme
                        ? Icons.dark_mode_rounded
                        : Icons.light_mode_rounded,
                    size: 14,
                    color: widget.controller.isLightTheme
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
