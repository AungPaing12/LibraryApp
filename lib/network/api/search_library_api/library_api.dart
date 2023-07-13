import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../constant/api_constant.dart';
import '../../response/search_response/search_response.dart';

part 'library_api.g.dart';

@RestApi(baseUrl: searchBaseURL)
abstract class LibraryApi {
  factory LibraryApi(Dio dio) => _LibraryApi(dio);

  @GET(searchEndPoint)
  Future<SearchResponse> getSearchBookList(
    @Query(kQueryParams) String apiKey,
  );
}
