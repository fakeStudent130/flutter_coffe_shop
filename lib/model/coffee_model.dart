class CoffeeModel {
  late int? id;
  late String? menu;
  late int? rating;
  late String? category;
  late String? reviewer;
  late String? description;
  late int? price;
  late String? imgUrl;

  CoffeeModel({
    this.id,
    this.menu,
    this.rating,
    this.category,
    this.reviewer,
    this.description,
    this.price,
    this.imgUrl,
  });

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menu = json['Menu'];
    rating = json['Rating'];
    category = json['Category'];
    reviewer = json['Reviewer'];
    description = json['Description'];
    price = json['Price'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "Menu": menu,
        "Rating": rating,
        "Category": category,
        "Reviewer": reviewer,
        "Description": description,
        "Price": price,
        "imgUrl": imgUrl,
      };
}
