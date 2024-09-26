// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BatteryStore on _BatteryStoreBase, Store {
  late final _$batteryLevelAtom =
      Atom(name: '_BatteryStoreBase.batteryLevel', context: context);

  @override
  int? get batteryLevel {
    _$batteryLevelAtom.reportRead();
    return super.batteryLevel;
  }

  @override
  set batteryLevel(int? value) {
    _$batteryLevelAtom.reportWrite(value, super.batteryLevel, () {
      super.batteryLevel = value;
    });
  }

  late final _$batteryLevelTextAtom =
      Atom(name: '_BatteryStoreBase.batteryLevelText', context: context);

  @override
  String get batteryLevelText {
    _$batteryLevelTextAtom.reportRead();
    return super.batteryLevelText;
  }

  @override
  set batteryLevelText(String value) {
    _$batteryLevelTextAtom.reportWrite(value, super.batteryLevelText, () {
      super.batteryLevelText = value;
    });
  }

  late final _$loadBatteryLevelAsyncAction =
      AsyncAction('_BatteryStoreBase.loadBatteryLevel', context: context);

  @override
  Future<void> loadBatteryLevel() {
    return _$loadBatteryLevelAsyncAction.run(() => super.loadBatteryLevel());
  }

  @override
  String toString() {
    return '''
batteryLevel: ${batteryLevel},
batteryLevelText: ${batteryLevelText}
    ''';
  }
}
