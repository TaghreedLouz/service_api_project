import 'package:service_api_project/model/api_image_respons.dart';
import 'package:service_api_project/model/api_worker_respons.dart';
import 'package:service_api_project/model/order.dart';

mixin ApiMixin{
  ApiRespons faildResponse = ApiRespons(message:"something wrong" , success: false);
  ApiImageRespons faildResponseiMAGE = ApiImageRespons(success: false,message: "someThing Wrong with image");

}