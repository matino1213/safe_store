class Restaurant {
  int? id;
  String? title;
  String? address;
  String? image;
  String? createAt;
  String? updateAt;
  int? counter;
  int? isSlide;
  String? description;

  Restaurant(
      {this.id,
        this.title,
        this.address,
        this.image,
        this.createAt,
        this.updateAt,
        this.counter,
        this.isSlide,
        this.description});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    image = json['image'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    counter = json['counter'];
    isSlide = json['isSlide'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['address'] = address;
    data['image'] = image;
    data['createAt'] = createAt;
    data['updateAt'] = updateAt;
    data['counter'] = counter;
    data['isSlide'] = isSlide;
    data['description'] = description;
    return data;
  }
}