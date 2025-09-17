import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';

class ProductDetailImageWidget extends StatefulWidget {
  final String imagePath;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const ProductDetailImageWidget({
    super.key,
    required this.imagePath,
    this.isFavorite = false,
    this.onFavoriteToggle,
  });

  @override
  State<ProductDetailImageWidget> createState() =>
      _ProductDetailImageWidgetState();
}

class _ProductDetailImageWidgetState extends State<ProductDetailImageWidget> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorSchemes.grey.withAlpha(25),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: widget.imagePath.startsWith('http')
              ? CachedNetworkImage(
                  imageUrl: widget.imagePath,
                  height: 200,
                  width: 300,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Container(
                    height: 200,
                    width: 300,
                    color: AppColorSchemes.grey.withAlpha(25),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColorSchemes.green,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 200,
                    width: 300,
                    color: AppColorSchemes.grey.withAlpha(25),
                    child: Icon(
                      Icons.image_not_supported,
                      color: AppColorSchemes.grey,
                      size: 80,
                    ),
                  ),
                )
              : Image.asset(
                  widget.imagePath,
                  height: 200,
                  width: 300,
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }
}
