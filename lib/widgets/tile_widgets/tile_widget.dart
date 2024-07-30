import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget(
      {super.key,
      required this.icon,
      this.iconSize = 60.0,
      this.titleFontSize = 20.0,
      required this.iconColor,
      required this.title,
      this.onTap});

  final IconData icon;
  final double? iconSize;
  final Color iconColor;
  final VoidCallback? onTap;
  final String title;
  final double titleFontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            Text(
              maxLines: 2,
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: titleFontSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
