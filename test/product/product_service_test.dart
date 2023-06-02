import 'package:bloc_advance/features/home/model/product_model.dart';
import 'package:bloc_advance/features/home/service/home_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late IHomeService homeService;

  setUp(() {
    homeService = HomeService(
      NetworkManager<ProductModel>(
        options: BaseOptions(baseUrl: 'https://fakestoreapi.com/'),
      ),
    );
  });
  test("fetchAllProducts - test five elements ", () async {
    final response = await homeService.fetchAllProducts();

    expect(response, isNotEmpty);
  });

  test("fetchAllCategories", () async {
    final response = await homeService.fetchAllCategories();

    expect(response, isNotEmpty);
  });
}
