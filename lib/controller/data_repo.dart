import 'package:service_api_project/controller/api_controller.dart';
import 'package:service_api_project/model/order.dart';
import 'package:service_api_project/model/service.dart';

class DataRepo{
  ApiController _apiController = ApiController();

  // AllService
  Future<List<Service>> getAllUsers() async {
    List<Service> serviceList = [];
    var value = await _apiController.getAllService();
    // print(" \n data =====>  "+value["data"]+"\n ");

    if (value["success"] && value["data"] != null) {
      value["data"].forEach((e) {
        serviceList.add(Service.fromJson(e));
        // print(" \n data =====>  "+value["data"]+"\n ");
      });
    }
    return serviceList;
  }

  // AllOrders
  Future<List<Order>> getAllOrder() async {
    List<Order> orderList = [];
    var value = await _apiController.getAllOrder();
    // print(" \n data =====>  "+value["data"]+"\n ");

    if (value["success"] && value["data"] != null) {
      value["data"].forEach((e) {
        orderList.add(Order.fromJson(e));
        // print(" \n data =====>  "+value["data"]+"\n ");
      });
    }
    return orderList;
  }
}