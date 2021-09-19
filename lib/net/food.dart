class Food {
  String description;
  String image;
  String name;
  String type;

  Food({this.description, this.image, this.name, this.type});

  Food.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    image = json['image'];

    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['image'] = this.image;

    data['name'] = this.name;
    data['type'] = this.type;

    return data;
  }
}
