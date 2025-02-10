import 'package:flutter/material.dart';
import 'package:news_app_c13/core/models/category.dart';
import 'package:news_app_c13/ui/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Good Morning \nHere is Some News For You",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ...CategoryModel.categories.map((e) => CategoryItem(
                  category: e, index: CategoryModel.categories.indexOf(e)))
            ],
          ),
        ),
      ),
    );
  }
}
