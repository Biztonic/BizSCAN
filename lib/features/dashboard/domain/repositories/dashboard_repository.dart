import '../models/dashboard_layout.dart';

abstract class DashboardRepository {
  Future<void> saveLayout(DashboardLayout layout);
  Future<DashboardLayout?> getLayout(String id);
  Future<List<DashboardLayout>> getAllLayouts();
  Future<void> deleteLayout(String id);
}
