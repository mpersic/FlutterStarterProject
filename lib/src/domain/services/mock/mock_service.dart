import 'package:injectable/injectable.dart';
import 'package:flutter_starter_project/src/data/data.dart';

abstract class IMockService {
  Future<List<Item>> getMockItems();
}

@Injectable(as: IMockService)
class MockService implements IMockService {
  final IMockRepository repository;

  MockService({required this.repository});

  @override
  Future<List<Item>> getMockItems() async {
    return await repository.getMockItems();
  }
}
