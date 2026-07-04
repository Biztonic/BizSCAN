import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../domain/models/dashboard_layout.dart';
import '../../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final Box<String> _dashboardBox;

  DashboardRepositoryImpl(this._dashboardBox);

  @override
  Future<void> saveLayout(DashboardLayout layout) async {
    await _dashboardBox.put(layout.id, jsonEncode(layout.toJson()));
  }

  @override
  Future<DashboardLayout?> getLayout(String id) async {
    final raw = _dashboardBox.get(id);
    if (raw == null) return null;
    try {
      return DashboardLayout.fromJson(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<DashboardLayout>> getAllLayouts() async {
    final list = <DashboardLayout>[];
    for (final raw in _dashboardBox.values) {
      try {
        list.add(DashboardLayout.fromJson(jsonDecode(raw)));
      } catch (_) {}
    }
    return list;
  }

  @override
  Future<void> deleteLayout(String id) async {
    await _dashboardBox.delete(id);
  }
}
