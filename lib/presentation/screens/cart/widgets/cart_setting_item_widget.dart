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
          Image.asset(
            imagePath,
            width: width ?? 50,
            height: height ?? 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTypography.textFont16W600.copyWith(
                    color: AppColorSchemes.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTypography.textFont14W500.copyWith(
                    color: AppColorSchemes.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: AppColorSchemes.grey),
                onPressed: onDelete,
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: AppTypography.textFont16W500.copyWith(
                  color: AppColorSchemes.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
