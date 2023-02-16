
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:test_work/configs.dart';


import 'entities.dart';

part 'client.g.dart';

@RestApi()
abstract class NewsApi {
  factory NewsApi(Dio dio) = _NewsApi;

  @GET("https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$newsApiKey")
  Future<NewsModel> fetchNews();

}
