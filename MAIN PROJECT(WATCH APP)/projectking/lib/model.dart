class CartItem {
  final String productId;
  final String size;
  final String color;
  final int quantity;

  CartItem({
    required this.productId,
    required this.size,
    required this.color,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'] as String,
      size: json['size'] as String,
      color: json['color'] as String,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'size': size,
      'color': color,
      'quantity': quantity,
    };
  }
}
