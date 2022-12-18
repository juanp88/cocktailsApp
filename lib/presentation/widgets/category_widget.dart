import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryWidget extends ConsumerWidget {
  final String categoryName;
  final String routeName;
  CategoryWidget(this.categoryName, this.routeName, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        height: 80,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
