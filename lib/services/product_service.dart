import 'package:dio/dio.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);
  final baseUrl = 'https://fakestoreapi.com/products';



  Future<Response> fetchProducts() async {
    final response = await dio.get(
      baseUrl,
    );
    return response;
  }
}

