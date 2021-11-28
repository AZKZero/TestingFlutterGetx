import 'package:dio/dio.dart';
import 'package:projectx/database/models/sample.dart';
import 'package:retrofit/http.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET("/todos/1")
  Future<SampleX> getASample();
}
