import 'package:injectable/injectable.dart';

import 'dart:async';

import 'package:flutter_starter_project/src/data/data.dart';

abstract class IMockRepository {
  Future<List<Item>> getMockItems();
}

@Injectable(as: IMockRepository)
class MockRepository implements IMockRepository {
  @override
  Future<List<Item>> getMockItems() async {
    await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds
    return [
      Item('Apple', 10),
      Item('Plant 2', 10),
      Item('Plant 3', 10),
    ];
  }
}
