class Amenity {
  String? image;
  String? title;
  String? id;

  Amenity({this.image, this.title, this.id});

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        image: json['image'] as String?,
        title: json['title'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        '_id': id,
      };
}
