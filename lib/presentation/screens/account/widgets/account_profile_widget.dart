import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class AccountProfileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String avatarPath;
  const AccountProfileWidget({
    super.key,
    required this.name,
    required this.email,
    this.avatarPath = AppImagesPath.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 31),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColorSchemes.black.withAlpha(70)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 26, bottom: 41),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: CachedNetworkImageProvider(avatarPath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: AppTypography.textFont18W600.copyWith(
                          color: AppColorSchemes.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.edit, color: AppColorSchemes.green, size: 20),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: AppTypography.textFontI14W500.copyWith(
                      color: AppColorSchemes.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
