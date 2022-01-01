import 'package:flutter/material.dart';

class ClickableImage extends StatelessWidget {
  const ClickableImage({Key? key, required this.url, required this.isNetwork, required this.onPressed}) : super(key: key);

  final String? url;
  final bool isNetwork;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return url != null
        ? InkWell(
            onTap: onPressed,
            child: Image.network(
              url!,
              fit: BoxFit.contain,
            ),
          )
        : const SizedBox.shrink();
  }
}
