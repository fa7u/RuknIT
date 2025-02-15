class Products {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;


  Products.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['price'] = this.price;
  //   data['description'] = this.description;
  //   data['category'] = this.category;
  //   data['image'] = this.image;
  //   if (this.rating != null) {
  //     data['rating'] = this.rating!.toJson();
  //   }
  //   return data;
  // }
}

class Rating {
  num? rate;
  int? count;


  Rating.fromJson(Map<dynamic, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['rate'] = this.rate;
  //   data['count'] = this.count;
  //   return data;
  // }
}