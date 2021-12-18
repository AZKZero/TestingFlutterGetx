import 'package:dio/dio.dart';
import 'package:projectx/database/models/application/sample.dart';
import 'package:projectx/database/models/server/blog_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET("/todos/1")
  Future<SampleX> getASample();

  @GET("https://my-json-server.typicode.com/sohel-cse/simple-blog-api/db")
  Future<HttpResponse<BlogResponse>> getBlogs();
}
