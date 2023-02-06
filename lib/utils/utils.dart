import 'package:flutter/foundation.dart';

void setupDioOptions(dio) {
  // dio.options.headers['x-access-token'] = box.read(userStorage)['token'];
  dio.options.headers['content-Type'] = 'application/json; charset=UTF-8';
  dio.options.headers["Access-Control-Allow-Origin"] = "*";
  dio.options.headers["Access-Control-Allow-Credentials"] = true;
  try {
    // dio.options.headers["x-access-token"] = box.read(userStorage)['token'];
  } catch (e) {
    debugPrint("Token Not Provided");
  }
}
