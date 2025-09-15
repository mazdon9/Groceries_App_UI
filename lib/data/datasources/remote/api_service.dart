import 'package:dio/dio.dart';
import 'package:groceries_app/data/models/requests/login_schema.dart';
import 'package:groceries_app/data/models/requests/update_a_cart_schema.dart';
import 'package:groceries_app/data/models/responses/cart_dto.dart';
import 'package:groceries_app/data/models/responses/favorite_product_dto.dart';
import 'package:groceries_app/data/models/responses/login_dto.dart';
import 'package:groceries_app/data/models/responses/product_dto.dart';
import 'package:groceries_app/data/models/responses/user_info_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

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

  // Cart APIs
  @GET('/carts/{id}')
  Future<CartDto> getCartItems(@Path('id') int id);

  @PUT('/carts/{id}')
  Future<CartDto> updateCart(
    @Path('id') int id,
    @Body() UpdateACartSchema updateACartSchema,
  );

  @DELETE('/carts/{id}')
  Future<CartDto> deleteCart(@Path('id') int id);

  @DELETE('/products/{id}')
  Future<void> deleteAProductInCart(@Path('id') int id);

  @GET('/products')
  Future<ProductResponseDto> getAllProducts();
}
