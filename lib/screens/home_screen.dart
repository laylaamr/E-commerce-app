import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';
import '../widgets/home/banner_list_view.dart';
import '../widgets/home/categroy_list.dart';
import '../widgets/home/product_grid_view.dart';
import '../widgets/home/search_bar.dart';
import '../widgets/home/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<ProductModel>> fetchProduct() async {
    final result = await ProductService(Dio()).fetchProducts();
    return (result["data"]["data"] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSearchBar(),
          const BannerListView(),
          const SectionHeader(
            title: 'Category',
            seeMore: 'See More',
          ),
          const CategoryList(
            categories: [
              {
                "name": "All",
                "image": "assets/category_images/category1.png",
              },
              {
                "name": "Apparel",
                "image": "assets/category_images/category2.png"
              },
              {
                "name": "School",
                "image": "assets/category_images/category3.png"
              },
              {
                "name": "Sport",
                "image": "assets/category_images/category4.png"
              },
              {
                "name": "Electronic",
                "image": "assets/category_images/category5.png"
              },
              {
                "name": "Apparel",
                "image": "assets/category_images/category2.png"
              },
              {
                "name": "School",
                "image": "assets/category_images/category3.png"
              },
              {
                "name": "Sport",
                "image": "assets/category_images/category4.png"
              },
              {
                "name": "Electronic",
                "image": "assets/category_images/category5.png"
              },
            ],
          ),
          const SectionHeader(
            title: 'Popular Products',
            seeMore: 'See More',
          ),
          ProductGridView(),
        ],
      ),
    );
  }
}
