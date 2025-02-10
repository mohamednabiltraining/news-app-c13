import 'package:news_app_c13/core/app_assets.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imagePath;

  CategoryModel(
      {required this.name, required this.imagePath, required this.id});

  static List<CategoryModel> categories = [
    CategoryModel(id: 'general', name: 'General', imagePath: AppAssets.general),
    CategoryModel(
        id: 'business', name: 'Business', imagePath: AppAssets.business),
    CategoryModel(id: 'sports', name: 'Sports', imagePath: AppAssets.sports),
    CategoryModel(id: 'health', name: 'Health', imagePath: AppAssets.health),
    CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        imagePath: AppAssets.entertainment),
    CategoryModel(
        id: 'technology', name: 'Technology', imagePath: AppAssets.technology),
    CategoryModel(id: 'science', name: 'Science', imagePath: AppAssets.science),
  ];
}
