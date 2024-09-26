import 'package:mobx/mobx.dart';
import '../../domain/usecases/get_battery_level_usecase.dart';

part 'battery_store.g.dart';

class BatteryStore = _BatteryStoreBase with _$BatteryStore;

abstract class _BatteryStoreBase with Store {
  final GetBatteryLevelUseCase getBatteryLevelUseCase;

  _BatteryStoreBase({required this.getBatteryLevelUseCase});

  @observable
  int? batteryLevel;

  @observable
  String batteryLevelText = 'Carregando nível de bateria...';

  @action
  Future<void> loadBatteryLevel() async {
    try {
      final level = await getBatteryLevelUseCase();
      batteryLevel = level;
      batteryLevelText = 'Nível de bateria: $batteryLevel%';
    } catch (e) {
      batteryLevelText = 'Não foi possível obter o nível de bateria.';
    }
  }
}
