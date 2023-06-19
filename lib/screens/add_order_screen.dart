import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_api_project/controller/api_controller.dart';
import 'package:service_api_project/controller/api_settings.dart';
import 'package:service_api_project/controller/custom_appbar_clipper.dart';
import 'package:service_api_project/model/api_image_respons.dart';
import 'package:service_api_project/model/api_worker_respons.dart';
import 'package:service_api_project/model/order.dart';
import 'package:service_api_project/screens/done_order_screen.dart';
import 'package:service_api_project/screens/home_screen.dart';
import 'package:http/http.dart' as http;

class AddOrderScreen extends StatefulWidget {


  int id;
  AddOrderScreen(this.id);



  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  late TextEditingController imageController = TextEditingController();
  late TextEditingController detailsController = TextEditingController();
  late TextEditingController locationController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? file;
  late List<String> photos = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
        clipper: CustomAppBarClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("Smith"),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                file = await picker.pickImage(source: ImageSource.gallery);
                ApiImageRespons responce = await ApiController().uploadImage(path: file!.path);

                photos =[file!.path];



                if(responce.success!){
                  Navigator.pop(context);
                }
                setState(() {
                });
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),

                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      file == null?Image.asset("assets/image.png",height: 40,width: 40,):Image.file( File(file!.path)),
                      SizedBox(width: 20),
                      Text("Image Problem"),
                    ],
                  ),
                ),
              ),
            )
,
            SizedBox(height: 5),
            Align(alignment: Alignment.topLeft, child: Text("image must be no more than 2 MB Max 5 Image", style: TextStyle(color: Color(0xFF7F8FA6)),)),
            SizedBox(height: 40),

            TextField(
              controller: detailsController,
              onSubmitted: (value) {
               // detailsController = value as TextEditingController;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Color(0xFF346EDF)),
                ),
                hintText: 'More Details About the Problem...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: locationController,
              onSubmitted: (value) {
              //  locationController = value as TextEditingController;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Color(0xFF346EDF)),
                ),
                hintText: 'More Details About the Problem...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFAF8344)),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(17),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/flag.png',
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("+966"),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      onSubmitted: (value) {
                       // phoneController = value as TextEditingController;

                      },
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Color(0xFFAF8344)),
                      cursorColor: Color(0xFFAF8344),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async => _performAddOrder(),

              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 55),
                primary: Colors.black,
              ),
              child: Text("ADD ORDER"),
            )

          ]),
        ),
      ),
    );
  }

  Future<void> _performAddOrder() async {
    if (_checkData() && photos.isNotEmpty) {
      await _addOrder();
    }
  }

  bool _checkData() {
    if (
    widget.id != null &&
    detailsController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      return true;
    }

    return false;
  }




  Future<void> _addOrder() async {
    if (_checkData()) {
      Order order = getOrders();
      ApiImageRespons apiResponse = await ApiController().addOrder(order: order);
      print(apiResponse.message);
      print(apiResponse.success);
      print(widget.id);

      Fluttertoast.showToast(
        msg: apiResponse.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      if (apiResponse.success!) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DoneOrderScreen()));
      }
    }
  }


  Order getOrders() {
    Order order = Order();
    order.workId = widget.id;
    order.details = detailsController.text;
    order.detailsAddress = locationController.text;
    order.phone = phoneController.text;
    order.lat = "22.00";
    order.long = "24.000";
    order.photoOrder = photos;
    return order;
  }

}
