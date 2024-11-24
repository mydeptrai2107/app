import 'package:flutter_amazon_clone_bloc/src/data/models/zalo_order.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:sprintf/sprintf.dart';

import '../../utils/u.zalo.dart';

class ZaloPayConfig {
  static const String appId = "2554";
  static const String key1 = String.fromEnvironment('ZALO_PAY_KEY1',
      defaultValue: 'sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn');
  static const String key2 = String.fromEnvironment('ZALO_PAY_KEY2',
      defaultValue: 'trMrHtvjo6myautxDUiAcYsVtaeQ8nhf');

  static const String appUser = "zalopaydemo";
  static int transIdDefault = 1;
}

Future<CreateOrderResponse?> createOrder(double price) async {
  var header = <String, String>{};
  header["Content-Type"] = "application/x-www-form-urlencoded";

  var body = <String, String>{};
  body["app_id"] = ZaloPayConfig.appId;
  body["app_user"] = ZaloPayConfig.appUser;
  body["app_time"] = DateTime.now().millisecondsSinceEpoch.toString();
  body["amount"] = price.toStringAsFixed(0);
  body["app_trans_id"] = getAppTransId();
  body["embed_data"] = "{}";
  body["item"] = "[]";
  body["bank_code"] = getBankCode();
  body["description"] = getDescription(body["app_trans_id"] ?? '');

  var dataGetMac = sprintf("%s|%s|%s|%s|%s|%s|%s", [
    body["app_id"],
    body["app_trans_id"],
    body["app_user"],
    body["amount"],
    body["app_time"],
    body["embed_data"],
    body["item"]
  ]);
  body["mac"] = getMacCreateOrder(dataGetMac);
  print("mac: ${body["mac"]}");

  http.Response response = await http.post(
    Uri.parse(Endpoints.createOrderUrl),
    headers: header,
    body: body,
  );

  print("body_request: $body");
  if (response.statusCode != 200) {
    return null;
  }

  var data = jsonDecode(response.body);
  print("data_response: $data}");

  return CreateOrderResponse.fromJson(data);
}
