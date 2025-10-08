import 'package:coffe_app/features/home/data/models/coffee_model.dart';
import 'package:dio/dio.dart';

class GetCoffeeData {
  Dio dio = Dio();

  Future<List<CoffeModel>> getCoffe() async {
    var respons = await dio.get('https://api.sampleapis.com/coffee/hot');

    List<CoffeModel> coffeList = [];
    for (var item in respons.data) {
      coffeList.add(CoffeModel.fromJson(item));
    }
    return coffeList;
  }
}
