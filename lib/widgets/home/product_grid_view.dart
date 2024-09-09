import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/product_provider.dart';

import '../../models/product_model.dart';
import '../../screens/detail_screen.dart';
import 'product_item.dart'; // Import the new grid widget

class ProductGridView extends StatelessWidget {


  const ProductGridView({super.key, });

  @override
  Widget build(BuildContext context) {
     return Consumer<ProductProvider> (builder: (context, productProvider, child) {
       if(productProvider.isLoading){
         return const SliverToBoxAdapter(child: Center(child:CircularProgressIndicator(color: Colors.black,)));
       }
      else if(productProvider.errorMessage != null){
         return SliverToBoxAdapter(child: Center(child: Text("${productProvider.errorMessage}")));
       }
      else{
         return   ProductItem(products: productProvider.products,);
       }
     }
     );

  }
}
