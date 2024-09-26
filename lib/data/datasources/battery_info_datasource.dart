import 'package:flutter/services.dart';

abstract class BatteryInfoDataSource {
  Future<int> getBatteryLevel();
}

class BatteryInfoDataSourceImpl implements BatteryInfoDataSource {
  static const platform = MethodChannel('battery_level');

  @override
  Future<int> getBatteryLevel() async {
    try {
      final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } on PlatformException catch (e) {
      throw Exception('Erro ao obter nível de bateria: ${e.message}');
    }
  }
}
