import 'package:currency/config/dio_catch_config.dart';
import 'package:currency/config/dio_config.dart';
import 'package:currency/model/currency_model.dart';
import 'package:dio/dio.dart';

class CurrencyService {
  Future<dynamic> getCurrency() async {
    try {
      Response response = await DioConfig.createRequest()
          .get("https://nbu.uz/uz/exchange-rates/json/a");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CurrencyModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
