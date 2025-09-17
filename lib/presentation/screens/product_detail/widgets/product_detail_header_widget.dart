import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';

class ProductDetailHeaderWidget extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onShare;

  const ProductDetailHeaderWidget({super.key, this.onBack, this.onShare});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onBack ?? () => Navigator.pop(context),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColorSchemes.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColorSchemes.black,
                  size: 18,
                ),
              ),
            ),
            GestureDetector(
              onTap: onShare,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColorSchemes.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.share_outlined,
                  color: AppColorSchemes.black,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
