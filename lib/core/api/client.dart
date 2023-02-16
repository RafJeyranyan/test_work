
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:test_work/configs.dart';


import 'entities.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://newsapi.org")
abstract class NewsApi {
  factory NewsApi(Dio dio) = _NewsApi;

  @GET("/v2/top-headlines?country=us&category=sports&apiKey=$newsApiKey")
  Future<NewsModel?> fetchNews();

}
