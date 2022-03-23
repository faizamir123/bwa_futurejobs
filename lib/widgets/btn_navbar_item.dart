import 'package:flutter/material.dart';

class ButtonNavbarItem extends StatelessWidget {
  final String? imageUrl;
  final bool? isActive;

  ButtonNavbarItem({this.imageUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl ?? '',
      width: 24,
      height: 24,
      color: isActive ?? false ? Color(0xff272C2F) : Color(0xffB3B5C4),
    );
  }
}
