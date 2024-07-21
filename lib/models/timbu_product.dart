class ProductResponse {
  final int page;
  final int size;
  final int total;
  final dynamic debug;
  final dynamic previousPage;
  final dynamic nextPage;
  final List<Item> items;

  ProductResponse({
    required this.page,
    required this.size,
    required this.total,
    this.debug,
    this.previousPage,
    this.nextPage,
    required this.items,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<Item> items = itemsList.map((i) => Item.fromJson(i)).toList();

    return ProductResponse(
      page: json['page'],
      size: json['size'],
      total: json['total'],
      debug: json['debug'],
      previousPage: json['previous_page'],
      nextPage: json['next_page'],
      items: items,
    );
  }
}

class Item {
  final String name;
  final String? description;
  final String uniqueId;
  final String urlSlug;
  final bool isAvailable;
  final bool isService;
  final dynamic previousUrlSlugs;
  final bool unavailable;
  final dynamic unavailableStart;
  final dynamic unavailableEnd;
  final String id;
  final dynamic parentProductId;
  final dynamic parent;
  final String organizationId;
  final List<dynamic> productImage;
  final List<dynamic> categories;
  final DateTime dateCreated;
  final DateTime lastUpdated;
  final String userId;
  final List<Photo> photos;
  final List<Price> currentPrice;
  final bool isDeleted;
  final double availableQuantity;
  final dynamic sellingPrice;
  final dynamic discountedPrice;
  final dynamic buyingPrice;
  final dynamic extraInfos;

  Item({
    required this.name,
    this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.isAvailable,
    required this.isService,
    this.previousUrlSlugs,
    required this.unavailable,
    this.unavailableStart,
    this.unavailableEnd,
    required this.id,
    this.parentProductId,
    this.parent,
    required this.organizationId,
    required this.productImage,
    required this.categories,
    required this.dateCreated,
    required this.lastUpdated,
    required this.userId,
    required this.photos,
    required this.currentPrice,
    required this.isDeleted,
    required this.availableQuantity,
    this.sellingPrice,
    this.discountedPrice,
    this.buyingPrice,
    this.extraInfos,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    var photosList = json['photos'] as List;
    List<Photo> photos = photosList.map((i) => Photo.fromJson(i)).toList();

    var currentPriceList = json['current_price'] as List;
    List<Price> currentPrice =
        currentPriceList.map((i) => Price.fromJson(i)).toList();

    return Item(
      name: json['name'],
      description: json['description'],
      uniqueId: json['unique_id'],
      urlSlug: json['url_slug'],
      isAvailable: json['is_available'],
      isService: json['is_service'],
      previousUrlSlugs: json['previous_url_slugs'],
      unavailable: json['unavailable'],
      unavailableStart: json['unavailable_start'],
      unavailableEnd: json['unavailable_end'],
      id: json['id'],
      parentProductId: json['parent_product_id'],
      parent: json['parent'],
      organizationId: json['organization_id'],
      productImage: json['product_image'] ?? [],
      categories: json['categories'] ?? [],
      dateCreated: DateTime.parse(json['date_created']),
      lastUpdated: DateTime.parse(json['last_updated']),
      userId: json['user_id'],
      photos: photos,
      currentPrice: currentPrice,
      isDeleted: json['is_deleted'],
      availableQuantity: json['available_quantity'].toDouble(),
      sellingPrice: json['selling_price'],
      discountedPrice: json['discounted_price'],
      buyingPrice: json['buying_price'],
      extraInfos: json['extra_infos'],
    );
  }
}

class Photo {
  final String modelName;
  final String modelId;
  final String organizationId;
  final String filename;
  final String url;
  final bool isFeatured;
  final bool saveAsJpg;
  final bool isPublic;
  final bool fileRename;
  final int position;

  Photo({
    required this.modelName,
    required this.modelId,
    required this.organizationId,
    required this.filename,
    required this.url,
    required this.isFeatured,
    required this.saveAsJpg,
    required this.isPublic,
    required this.fileRename,
    required this.position,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      modelName: json['model_name'],
      modelId: json['model_id'],
      organizationId: json['organization_id'],
      filename: json['filename'],
      url: json['url'],
      isFeatured: json['is_featured'],
      saveAsJpg: json['save_as_jpg'],
      isPublic: json['is_public'],
      fileRename: json['file_rename'],
      position: json['position'],
    );
  }
}

class Price {
  final Map<String, dynamic> price;

  Price({required this.price});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(price: json);
  }
}
