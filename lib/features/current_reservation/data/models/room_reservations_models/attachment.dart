class Attachment {
  String? image;
  String? id;

  Attachment({this.image, this.id});

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        image: json['image'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        '_id': id,
      };
}
