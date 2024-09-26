import '../../domain/repositories/battery_repository.dart';
import '../datasources/battery_info_datasource.dart';

class BatteryRepositoryImpl implements BatteryRepository {
  final BatteryInfoDataSource dataSource;

  BatteryRepositoryImpl(this.dataSource);

  @override
  Future<int> getBatteryLevel() async {
    return await dataSource.getBatteryLevel();
  }
}
