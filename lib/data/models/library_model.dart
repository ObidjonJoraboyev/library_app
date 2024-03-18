class BookModel {
  final int uuid;
  final String stringUuId;
  final int categoryId;
  final String name;
  final String description;
  final String auth;
  final String imageUrl;
  final double rate;
  final double price;
  final int pageCount;
  final String publicationDate;

  BookModel({
    required this.stringUuId,
    required this.imageUrl,
    required this.name,
    required this.auth,
    required this.categoryId,
    required this.description,
    required this.pageCount,
    required this.price,
    required this.publicationDate,
    required this.rate,
    required this.uuid,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      stringUuId: json["_uuid"] as String? ?? "",
      imageUrl: json["image_url"] as String? ??
          "https://pics.clipartpng.com/Black_Book_PNG_Clipart-1048.png",
      name: json["name"] as String? ?? "",
      auth: json["author"] as String? ?? "",
      categoryId: json["category_id"] as int? ?? 0,
      description: json["description"] as String? ?? "",
      pageCount: json["page_count"] as int? ?? 0,
      price: (json["price"] as num? ?? 0.0).toDouble(),
      publicationDate: json["publication_date"] as String? ?? "",
      rate: (json["rate"] as num? ?? 0.0).toDouble(),
      uuid: json["uuid"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "image_url": imageUrl,
      "category_id": categoryId,
      "name": name,
      "description": description,
      "author": auth,
      "rate": rate,
      "price": price,
      "page_count": pageCount,
      "publication_date": publicationDate,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "uuid": uuid,
      "image_url": imageUrl,
      "category_id": categoryId,
      "name": name,
      "description": description,
      "author": auth,
      "rate": rate,
      "price": price,
      "page_count": pageCount,
      "publication_date": publicationDate,
    };
  }

  BookModel copyWith({
    String? name,
    String? stringUuId,
    String? auth,
    int? categoryId,
    String? description,
    int? pageCount,
    double? price,
    String? publicationDate,
    double? rate,
    int? uuid,
    String? imageUrl,
  }) {
    return BookModel(
      name: name ?? this.name,
      auth: auth ?? this.auth,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      price: price ?? this.price.toDouble(),
      publicationDate: publicationDate ?? this.publicationDate,
      rate: rate ?? this.rate.toDouble(),
      uuid: uuid ?? this.uuid,
      imageUrl: imageUrl ?? this.imageUrl,
      stringUuId: stringUuId ?? this.stringUuId,
    );
  }

  static BookModel initialValue = BookModel(
    imageUrl: "",
    name: "",
    auth: "",
    categoryId: 0,
    description: "",
    pageCount: 0,
    price: 0,
    publicationDate: "",
    rate: 0,
    uuid: 0,
    stringUuId: '',
  );
}
