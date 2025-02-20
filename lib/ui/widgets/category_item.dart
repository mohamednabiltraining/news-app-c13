import 'package:flutter/material.dart';
import 'package:news_app_c13/core/app_colors.dart';
import 'package:news_app_c13/data/models/category.dart';
import 'package:news_app_c13/ui/screens/home/home_screen.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index; // Receive index

  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    // Check if the item is even or odd
    bool isEven = index % 2 == 0;

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        HomeScreen.routeName,
        arguments: category,
      ),
      child: Container(
        height: height * 0.25,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment:
              isEven ? MainAxisAlignment.start : MainAxisAlignment.end,
          textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.cover,
                height: height * 0.25,
                width: width * 0.45,
              ),
            ),

            Expanded(
                child: buildCategoryText(
                    width, height)), // Left-aligned text for odds
          ],
        ),
      ),
    );
  }

  Widget buildCategoryText(double width, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          category.name,
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 30),
        ),
        SizedBox(height: height * 0.04),
        buildViewAllContainer(
          width,
          height,
        ),
      ],
    );
  }

  Container buildViewAllContainer(
    double width,
    double height,
  ) {
    return Container(
      width: width * 0.40,
      height: height * 0.06,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        textDirection: index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
        children: [
          const Spacer(),
          const Text(
            "View All",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.whiteColor,
            child: Icon(
              index % 2 == 0
                  ? Icons.arrow_forward_ios_rounded
                  : Icons.arrow_back_ios_rounded,
              color: AppColors.blackColor,
            ),
          )
        ],
      ),
    );
  }
}
