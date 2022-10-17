import 'dart:io';

import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CardImage extends StatelessWidget {
  final XFile file;
  final Function() onTapCallback;

  const CardImage({super.key, required this.file, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: size.width,
        height: size.height * 1,
        decoration: const BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          
          // image: DecorationImage(image: image)

          // image:
          //     DecorationImage(fit: BoxFit.cover, image: ImageProvider(Image.network(file.path)))),
        ),
      ),
    );
  }
}
