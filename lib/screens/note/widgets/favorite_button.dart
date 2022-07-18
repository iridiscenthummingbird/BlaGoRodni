import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.onTap,
  }) : super(key: key);
  final bool isFavorite;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(),
      icon: Icon(isFavorite ? Icons.star : Icons.star_outline),
    );
  }
}
