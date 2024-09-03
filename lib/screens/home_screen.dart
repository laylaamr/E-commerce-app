import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/services/product_service.dart';

import '../models/product_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<ProductModel>> fetchProduct() async {
    List<ProductModel> product = [];
    final result = await ProductService(Dio()).fetchProducts();
    for (var item in result["data"]["data"]) {
      product.add(ProductModel.fromJson(item));
    }
    return product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Products",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),),
      body: FutureBuilder<List<ProductModel>>(
        future: fetchProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
                ),
                itemBuilder: (context, index) {
                ProductModel productModel = snapshot.data![index];
                  return InkWell(
                    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(productModel:productModel),));
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.network(
                              productModel.image,
                              fit: BoxFit.fill,
                              height: MediaQuery.sizeOf(context).height * 0.20,
                              width: double.infinity,
                            ),
      
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          productModel.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(
                child: Text(
                  'Recipes is empty',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
