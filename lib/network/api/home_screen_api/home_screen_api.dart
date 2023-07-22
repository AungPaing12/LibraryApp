import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../constant/api_constant.dart';
import '../../response/home_screen_response/home_screen_response.dart';

part 'home_screen_api.g.dart';

@RestApi(baseUrl: homeScreenBaseURL)
abstract class HomeScreenApi {
  factory HomeScreenApi(Dio dio) => _HomeScreenApi(dio);

  @GET(homeScreenEndPoint)
  Future<HomeScreenResponse> getHomeScreenBookList(
      @Query(kQueryParamsPublishDate) String date,
      @Query(kQueryParamsApiKey) String apiKey);

}
