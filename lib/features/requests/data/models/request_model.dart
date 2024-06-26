import 'package:saghaf_desktop/features/requests/data/models/requests_model/requests_model.dart';

class RequestPaginationModel {
  String? message;
  Pagination? pagination;
  List<RequestsModel>? requestsList;

  RequestPaginationModel({
    this.message,
    this.pagination,
    this.requestsList,
  });

  factory RequestPaginationModel.fromJson(Map<String, dynamic> json) =>
      RequestPaginationModel(
        message: json["message"],
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        requestsList: json["data"] == null
            ? []
            : List<RequestsModel>.from(
                json["data"]!.map((x) => RequestsModel.fromJson(x))),
      );
}

class Pagination {
  int? currentPage;
  int? resultCount;
  int? totalPages;

  Pagination({
    this.currentPage,
    this.resultCount,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["currentPage"],
        resultCount: json["resultCount"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "resultCount": resultCount,
        "totalPages": totalPages,
      };
}
