class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

ProductModel.fromJson(Map<String, dynamic> json) {
  id = json['id'] != null ? int.tryParse(json['id']) : null;
  title = json['title'];
  price = json['price'] != null ? double.tryParse(json['price']) : null;
  description = json['description'];
  category = json['category'];
  image = json['image'];
  if (json['rating'] is Map<String, dynamic>) {
    rating = Rating.fromJson(json['rating']);
  } else {
    rating = null;
  }
}



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = double.tryParse(json['rate'] ?? '');
    count = int.tryParse(json['count'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
