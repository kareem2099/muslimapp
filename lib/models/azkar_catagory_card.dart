import 'package:flutter/material.dart';

class AzkarElsabahCardWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  const AzkarElsabahCardWidget({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
