import 'package:flutter/material.dart';

class ImageNetworkLoader extends StatelessWidget {
  final String url;

  const ImageNetworkLoader({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      //Hiện loading
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return SizedBox(
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      },
      //Hiện error
      errorBuilder: (_, _, _) {
        return SizedBox(child: Center(child: Icon(Icons.error)));
      },
    );
  }
}

class ImageAssetLoader extends StatelessWidget {
  final String asset;

  const ImageAssetLoader({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Image.asset(asset, fit: BoxFit.cover);
  }
}


