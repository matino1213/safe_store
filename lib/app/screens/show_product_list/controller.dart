import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/product.dart';

import '../../../models/category.dart';

class ShowProductListController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Category> categories = <Category>[].obs;

  getProducts() async {
    Dio myDio = Dio();
    myDio.get(
      '${serverAddress}product',
      options: Options(
        method: 'GET',
        responseType: ResponseType.json,
      ),
    ).then((response){
      if(response.statusCode! < 300){
        for(var item in response.data){
          Product product = Product.fromJson(item);
          products.add(product);
        }
      }//
      else{
        Get.snackbar('Error', response.data);
      }
    });
  }

  getCategory() async{
    Dio myDio = Dio();
    myDio.get(
      '${serverAddress}category',
      options: Options(
        method: 'GET',
        responseType: ResponseType.json,
      ),
    ).then((response){
      if(response.statusCode! < 300){
        for(var item in response.data){
          Category category = Category.fromJson(item);
          categories.add(category);
        }
      }//
      else{
        Get.snackbar('Error', response.data);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
    getCategory();
  }
}
