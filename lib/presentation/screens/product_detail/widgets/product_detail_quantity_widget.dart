import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ProductDetailQuantityWidget extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int>? onQuantityChanged;

  const ProductDetailQuantityWidget({
    super.key,
    this.initialQuantity = 1,
    this.onQuantityChanged,
  });

  @override
  State<ProductDetailQuantityWidget> createState() =>
      _ProductDetailQuantityWidgetState();
}

class _ProductDetailQuantityWidgetState
    extends State<ProductDetailQuantityWidget> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged?.call(_quantity);
    }
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged?.call(_quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decrease button
        GestureDetector(
          onTap: _decreaseQuantity,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: AppColorSchemes.grey.withAlpha(128)),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(Icons.remove, color: AppColorSchemes.grey, size: 20),
          ),
        ),
        const SizedBox(width: 24),
        // Quantity display
        Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          child: Text(
            _quantity.toString(),
            style: AppTypography.textFont18W600.copyWith(
              color: AppColorSchemes.black,
            ),
          ),
        ),
        const SizedBox(width: 24),
        // Increase button
        GestureDetector(
          onTap: _increaseQuantity,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: AppColorSchemes.green),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(Icons.add, color: AppColorSchemes.green, size: 20),
          ),
        ),
      ],
    );
  }
}
