class Basket {
  int? id;
  int? userId;
  int? restaurantId;
  int? productId;
  int? count;
  bool? isPaying;
  String? createdAt;
  String? updatedAt;

  Basket({
    this.id,
    this.userId,
    this.restaurantId,
    this.productId,
    this.count,
    this.isPaying,
    this.createdAt,
    this.updatedAt,
  });

  Basket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    restaurantId = json['restaurantId'];
    productId = json['productId'];
    count = json['count'];
    isPaying = json['isPaying'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['restaurantId'] = restaurantId;
    data['productId'] = productId;
    data['count'] = count;
    data['isPaying'] = isPaying;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
