import 'package:dio/dio.dart';
import 'package:groceries_app/data/models/requests/login_schema.dart';
import 'package:groceries_app/data/models/responses/favorite_product_dto.dart';
import 'package:groceries_app/data/models/responses/login_dto.dart';
import 'package:groceries_app/data/models/responses/user_info_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'api_service.g.dart';

@RestApi()
@lazySingleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @POST('/auth/login')
  Future<LoginDto> login(@Body() LoginSchema loginSchema);

  @GET('/auth/me')
  Future<UserInfoDto> getUserInfo();

  @GET('/carts/{id}')
  Future<FavoriteProductDto> getFavoriteProducts(@Path('id') int id);
}
