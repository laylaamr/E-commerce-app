import 'package:dio/dio.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);
  final baseUrl = 'https://fakestoreapi.com/products';

  get kLang => null;

  Future<Response> fetchProducts() async {

      final response = await dio.get(baseUrl,
      options: Options(
        headers: {
            'lang': 'en',

          })
      );
      return response.data;

    }
  }
