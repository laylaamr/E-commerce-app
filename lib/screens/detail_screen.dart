import 'package:flutter/material.dart';
import 'package:untitled1/models/product_model.dart';
class DetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const DetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
        icon: const Icon(
        Icons.arrow_back_rounded,
        size: 25,
    ),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
          title: Text(productModel.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(productModel.image),
                  fit: BoxFit.cover,
                )
              ),
            ),
              Text(productModel.description),
            ],

          ),
        ),
      ),
    );
  }
}
