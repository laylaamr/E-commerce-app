import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartProvider with ChangeNotifier {
  List<int> _cartProductIds = [];
  Map<int, int> _productCounters = {}; // Store counter for each product

  List<int> get cartProductIds => _cartProductIds;
  int getProductCounter(int productId) => _productCounters[productId] ?? 1;

  Database? _db;

  Future<void> initCart() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'cart.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart(id INTEGER PRIMARY KEY, counter INTEGER)',
        );
      },
      version: 1,
    );

    final List<Map<String, dynamic>> maps = await _db!.query('cart');
    _cartProductIds = List.generate(maps.length, (i) => maps[i]['id']);
    for (var map in maps) {
      _productCounters[map['id']] = map['counter'];
    }

    notifyListeners();
  }

  Future<void> addToCart(int productId) async {
    if (!_cartProductIds.contains(productId)) {
      _cartProductIds.add(productId);
      _productCounters[productId] = 1; // Initialize the counter to 1
      await _db!.insert(
        'cart',
        {'id': productId, 'counter': 1},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      notifyListeners();
    }
  }

  Future<void> removeFromCart(int productId) async {
    _cartProductIds.remove(productId);
    _productCounters.remove(productId); // Remove the counter as well
    await _db!.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [productId],
    );
    notifyListeners();
  }

  Future<void> updateCounter(int productId, int newCounter) async {
    _productCounters[productId] = newCounter;
    await _db!.update(
      'cart',
      {'counter': newCounter},
      where: 'id = ?',
      whereArgs: [productId],
    );
    notifyListeners();
  }

  void inc(int productId) {
    int currentCount = _productCounters[productId] ?? 1;
    updateCounter(productId, currentCount + 1);
    notifyListeners();
  }

  void dec(int productId) {
    int currentCount = _productCounters[productId] ?? 1;
    if (currentCount > 1) {
      updateCounter(productId, currentCount - 1);
      notifyListeners();
    }
  }

  int get totalItemCount {
    return _productCounters.values.fold(0, (sum, count) => sum + count);
  }
}
