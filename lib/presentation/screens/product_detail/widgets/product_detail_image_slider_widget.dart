import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';

class ProductDetailImageSliderWidget extends StatefulWidget {
  final List<String> images;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const ProductDetailImageSliderWidget({
    super.key,
    required this.images,
    this.isFavorite = false,
    this.onFavoriteToggle,
  });

  @override
  State<ProductDetailImageSliderWidget> createState() =>
      _ProductDetailImageSliderWidgetState();
}

class _ProductDetailImageSliderWidgetState
    extends State<ProductDetailImageSliderWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Container(
        height: 320.h,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColorSchemes.grey.withAlpha(25)),
        child: widget.images.isEmpty
            ? _buildPlaceholder()
            : widget.images.length == 1
            ? _buildSingleImage()
            : _buildImageSlider(),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Icon(
        Icons.image_not_supported,
        color: AppColorSchemes.grey.withAlpha(25),
        size: 80,
      ),
    );
  }

  Widget _buildSingleImage() {
    return Center(child: _buildImageContainer(widget.images.first));
  }

  Widget _buildImageSlider() {
    return Stack(
      children: [
        // Image Slider
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return Center(child: _buildImageContainer(widget.images[index]));
          },
        ),
        // Page Indicators
        _buildPageIndicators(),
        // Navigation arrows
        ..._buildNavigationArrows(),
      ],
    );
  }

  Widget _buildImageContainer(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 200.h,
        width: 300.w,
        fit: BoxFit.contain,
        placeholder: (context, url) => Container(
          height: 200.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: AppColorSchemes.grey.withAlpha(25),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColorSchemes.green,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: 200.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: AppColorSchemes.grey.withAlpha(25),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(
            Icons.image_not_supported,
            color: AppColorSchemes.grey,
            size: 80,
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicators() {
    if (widget.images.length <= 1) return const SizedBox.shrink();

    return Positioned(
      bottom: 20.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.images.length,
          (index) => Container(
            width: 8.w,
            height: 8.h,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index
                  ? AppColorSchemes.green
                  : AppColorSchemes.grey.withAlpha(128),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNavigationArrows() {
    if (widget.images.length <= 1) return [];

    return [
      // Left arrow
      Positioned(
        left: 16.w,
        top: 0,
        bottom: 0,
        child: Center(
          child: _buildArrowButton(
            icon: Icons.arrow_back_ios_new,
            isEnabled: _currentIndex > 0,
            onTap: () => _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ),
      // Right arrow
      Positioned(
        right: 16.w,
        top: 0,
        bottom: 0,
        child: Center(
          child: _buildArrowButton(
            icon: Icons.arrow_forward_ios,
            isEnabled: _currentIndex < widget.images.length - 1,
            onTap: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildArrowButton({
    required IconData icon,
    required bool isEnabled,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColorSchemes.white.withAlpha(179),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isEnabled ? AppColorSchemes.black : AppColorSchemes.grey,
          size: 16,
        ),
      ),
    );
  }
}
