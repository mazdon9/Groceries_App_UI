class UpdateCartItemParams {
  final int cartId;
  final int productId;
  final int quantity;

  const UpdateCartItemParams({
    required this.cartId,
    required this.productId,
    required this.quantity,
  });
}
