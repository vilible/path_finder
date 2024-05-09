import 'package:flutter/material.dart';

void showModal(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    showDragHandle: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (context, controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: widget,
      ),
    ),
  );
}
