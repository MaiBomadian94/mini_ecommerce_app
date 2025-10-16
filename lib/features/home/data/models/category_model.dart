class CategoryModel {
  final String categoryName;

  CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(String name) {
    return CategoryModel(categoryName: name);
  }
}
