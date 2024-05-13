import 'package:flutter/material.dart';
import 'package:way_finder/utils.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.child,
  });

  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      onPressed: () => showModal(context, child),
    );
  }
}
