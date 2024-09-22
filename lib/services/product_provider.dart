import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled1/services/product_service.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier{
  bool isLoading =false;

  List<ProductModel> products=[];
  String? errorMessage;
  Future fetchProduct() async {
    isLoading= true;
  notifyListeners();
 try{
   final result = await ProductService(Dio()).fetchProducts();

   for(var item in result.data){
     products.add(ProductModel.fromJson(item));
   }
 }
    catch(e){
      errorMessage= e.toString();
    }finally{
   isLoading =false;
   notifyListeners();
 }
  }
  List<ProductModel> getFavoriteProducts(List<int> favoriteIds) {
    return products.where((product) => favoriteIds.contains(product.id)).toList();
  }
  List<ProductModel> getCartProducts(List<int> cartIds) {
    return products.where((product) => cartIds.contains(product.id)).toList();
  }

}