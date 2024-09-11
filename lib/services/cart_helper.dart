import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartProvider with ChangeNotifier {
  List<int> _cartProductIds = [];

  List<int> get cartProductIds => _cartProductIds;

  Database? _db;

  Future<void> initCart() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'cart.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1,
    );

    final List<Map<String, dynamic>> maps = await _db!.query('cart');
    _cartProductIds = List.generate(maps.length, (i) => maps[i]['id']);

    notifyListeners();
  }

  Future<void> addToCart(int productId) async {
    if (!_cartProductIds.contains(productId)) {
      _cartProductIds.add(productId);
      await _db!.insert(
        'cart',
        {'id': productId},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      notifyListeners();
    }
  }

  Future<void> removeFromCart(int productId) async {
    _cartProductIds.remove(productId);
    await _db!.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [productId],
    );
    notifyListeners();
  }

  Future<void> toggleCart(int productId) async {
    if (_cartProductIds.contains(productId)) {
      await removeFromCart(productId);
    } else {
      await addToCart(productId);
    }
  }

  bool isInCart(int productId) {
    return _cartProductIds.contains(productId);
  }
}
