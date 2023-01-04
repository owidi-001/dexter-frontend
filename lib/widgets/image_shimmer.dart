import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.0,
      height: 180.0,
      child: Shimmer.fromColors(
        baseColor: AppTheme.light,
        highlightColor: AppTheme.white,
        child: Container(
          decoration: BoxDecoration(
              color: AppTheme.light,
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}


///child: Hero(
  //   tag: "${product.id}",
  //   child: product.image.toString().isNotEmpty
  //       ? Image.memory(
  //           const Base64Decoder().convert(product.image),
  //         )
  //       : const ImagePlaceholder(),
  // ),