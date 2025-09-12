import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class CartSettingItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final int quantity;
  final VoidCallback? onRemove;
  final VoidCallback? onAdd;
  final VoidCallback? onDelete;
  final double? width;
  final double? height;
  const CartSettingItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    this.onRemove,
    this.onAdd,
    this.onDelete,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColorSchemes.black.withAlpha(70)),
        ),
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image item
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imagePath.startsWith('http')
                ? CachedNetworkImage(
                    imageUrl: imagePath,
                    width: width ?? 70,
                    height: height ?? 70,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: width ?? 70,
                      height: height ?? 70,
                      color: AppColorSchemes.grey.withAlpha(20),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColorSchemes.green,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: width ?? 70,
                      height: height ?? 70,
                      color: AppColorSchemes.grey.withAlpha(20),
                      child: Icon(
                        Icons.image_not_supported,
                        color: AppColorSchemes.grey,
                        size: 30,
                      ),
                    ),
                  )
                : Image.asset(
                    imagePath,
                    width: width ?? 70,
                    height: height ?? 70,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 32),
          // info item and quantity controls
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTypography.textFont16W600.copyWith(
                    color: AppColorSchemes.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTypography.textFont14W500.copyWith(
                    color: AppColorSchemes.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                // Điều chỉnh số lượng
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: onRemove,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColorSchemes.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.remove, size: 20),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      quantity.toString(),
                      style: AppTypography.textFont16W600.copyWith(
                        color: AppColorSchemes.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: onAdd,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColorSchemes.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: AppColorSchemes.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Giá và nút xóa
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: AppColorSchemes.grey),
                  onPressed: onDelete,
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: AppTypography.textFont16W500.copyWith(
                    color: AppColorSchemes.black,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
