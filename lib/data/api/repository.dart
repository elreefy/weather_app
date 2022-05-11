import '../models/WeatherModel.dart';
import 'dio_helper.dart';

class ShopRepository {

  static Future<List<WeatherModel>> getData(
      {required String url}) async {
    final weatherData = await DioHelper.getData(url: 'location');
    return weatherData.map((data) => WeatherModel.fromJson(data)).toList();
  }
  // static Future<List<Article>> getSearchedArticles(String keyWord) async {
  //   final articles = await DioHelper.getSearchedData(
  //       query: {'q': keyWord, 'apiKey': apiKey, 'sortBy': 'publishedAt'});
  //   return articles.map((article) => Article.fromJson(article)).toList();
  // }
}