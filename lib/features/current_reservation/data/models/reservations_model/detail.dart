class Detail {
  String? title;
  String? id;

  Detail({this.title, this.id});

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        title: json['title'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        '_id': id,
      };
}
