import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceDetailController extends GetxController {
  Object deviceData = (context) => ModalRoute.of(context)!.settings.arguments;
}
