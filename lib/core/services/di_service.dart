import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'logging_service.dart';
import 'firestore_service.dart';
import 'storage_service.dart';
import '../utils/network_info.dart';
import '../utils/permission_helper.dart';
import '../utils/cache_manager.dart';
import '../../features/bluetooth/domain/repositories/bluetooth_repository.dart';
import '../../features/bluetooth/data/repositories/bluetooth_repository_impl.dart';
import '../../features/obd/domain/repositories/obd_repository.dart';
import '../../features/obd/data/repositories/obd_repository_impl.dart';
import '../../features/health/domain/repositories/health_repository.dart';
import '../../features/health/data/repositories/health_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/data/repositories/local_auth_repository.dart';
import '../../features/vehicle/domain/repositories/vehicle_repository.dart';
import '../../features/vehicle/data/repositories/vehicle_repository_impl.dart';
import '../../features/history/domain/repositories/scan_repository.dart';
import '../../features/history/data/repositories/scan_repository_impl.dart';
import '../../features/obd/domain/repositories/pid_repository.dart';
import '../../features/obd/data/repositories/pid_repository_impl.dart';
import '../../features/reports/domain/repositories/report_repository.dart';
import '../../features/reports/data/repositories/report_repository_impl.dart';
import '../../features/settings/domain/repositories/settings_repository.dart';
import '../../features/settings/data/repositories/settings_repository_impl.dart';
import '../../core/sync/domain/repositories/sync_repository.dart';
import '../../core/sync/data/repositories/sync_repository_impl.dart';
import '../../features/obd/domain/services/obd_transport.dart';
import '../../features/obd/domain/services/response_parser.dart';
import '../../features/obd/data/parsers/default_response_parser.dart';
import '../../features/obd/domain/services/command_executor.dart';
import '../../features/obd/data/executors/default_command_executor.dart';
import '../../features/obd/domain/services/protocol_detector.dart';
import '../../features/obd/domain/services/connection_monitor.dart';
import '../../features/obd/domain/repositories/elm327_profile_repository.dart';
import '../../features/obd/data/repositories/elm327_profile_repository_impl.dart';
import '../../features/obd/domain/services/elm327_engine.dart';
import '../../features/bluetooth/domain/services/bluetooth_permission_service.dart';
import '../../features/bluetooth/data/services/permission_service_impl.dart';
import '../../features/bluetooth/domain/services/bluetooth_state_monitor.dart';
import '../../features/bluetooth/data/services/state_monitor_impl.dart';
import '../../features/bluetooth/domain/services/bluetooth_discovery_service.dart';
import '../../features/bluetooth/data/services/discovery_service_impl.dart';
import '../../features/bluetooth/domain/services/bluetooth_connection_service.dart';
import '../../features/bluetooth/data/services/connection_service_impl.dart';
import '../../features/bluetooth/domain/services/bluetooth_auto_reconnect_service.dart';
import '../../features/bluetooth/data/services/auto_reconnect_service_impl.dart';
import '../../features/bluetooth/domain/repositories/bluetooth_device_repository.dart';
import '../../features/bluetooth/data/repositories/bluetooth_device_repository_impl.dart';
import '../../features/bluetooth/data/transports/bluetooth_transport_impl.dart';
import '../../features/health/domain/repositories/vehicle_health_repository.dart';
import '../../features/health/data/repositories/vehicle_health_repository_impl.dart';
import '../../features/health/domain/services/rules/health_rule_engine.dart';
import '../../features/health/domain/services/health_score_calculator.dart';
import '../../features/health/domain/services/trend_analyzer.dart';
import '../../features/health/domain/services/predictive_maintenance_engine.dart';
import '../../features/health/domain/services/explanation_engine.dart';
import '../../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../../features/dashboard/domain/services/live_session_recorder.dart';
import '../../features/dashboard/domain/services/dashboard_performance_monitor.dart';
import '../../features/dashboard/presentation/controllers/dashboard_controller.dart';
import '../../features/vehicle_intelligence/domain/repositories/vehicle_profile_repository.dart';
import '../../features/vehicle_intelligence/data/repositories/vehicle_profile_repository_impl.dart';
import '../../features/vehicle_intelligence/domain/services/vin_decoder_engine.dart';
import '../../features/vehicle_intelligence/domain/services/vehicle_specification_engine.dart';
import '../../features/vehicle_intelligence/domain/services/maintenance_scheduler.dart';
import '../../features/vehicle_intelligence/domain/services/compatibility_engine.dart';
import '../../features/reports/domain/services/report_builder_engine.dart';
import '../../features/reports/domain/services/pdf_generator.dart';
import '../../features/reports/domain/services/html_generator.dart';
import '../../features/reports/domain/services/csv_exporter.dart';
import '../../features/reports/domain/services/json_exporter.dart';
import '../../features/reports/domain/services/qr_verification_engine.dart';
import '../../features/reports/domain/services/digital_signature_engine.dart';

final GetIt sl = GetIt.instance;

class DiService {
  static Future<void> init() async {
    // Centralized Logging Service
    final loggingService = LoggingServiceImpl();
    sl.registerLazySingleton<LoggingService>(() => loggingService);

    // External dependencies
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
    
    sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.instance);

    // Initialize Local Database Boxes
    try {
      await Hive.initFlutter();
    } catch (_) {
      // Handle duplicate initialization in unit tests
    }

    final vehicleBox = await Hive.openBox<String>('vehicles');
    final scanBox = await Hive.openBox<String>('scans');
    final reportBox = await Hive.openBox<String>('health_reports');
    final pidBox = await Hive.openBox<String>('live_pids');
    final settingsBox = await Hive.openBox<String>('settings');
    final syncQueueBox = await Hive.openBox<String>('sync_queue');
    final syncLogBox = await Hive.openBox<String>('sync_logs');
    final conflictLogBox = await Hive.openBox<String>('conflict_logs');
    final elm327ProfileBox = await Hive.openBox<String>('elm327_profiles');
    final vehicleHealthBox = await Hive.openBox<String>('vehicle_health_history');
    final dashboardBox = await Hive.openBox<String>('dashboard_preferences');
    final vehicleProfilesBox = await Hive.openBox<String>('vehicle_profiles');
    final vehicleSpecsBox = await Hive.openBox<String>('vehicle_specifications');
    final maintenanceRecordsBox = await Hive.openBox<String>('maintenance_records');
    final serviceRemindersBox = await Hive.openBox<String>('service_reminders');
    final compatProfilesBox = await Hive.openBox<String>('compatibility_profiles');
    final reportsBox = await Hive.openBox<String>('reports');
    final reportTemplatesBox = await Hive.openBox<String>('report_templates');
    final reportExportsBox = await Hive.openBox<String>('report_exports');

    // Network & Permissions Utilities
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton<PermissionHelper>(() => PermissionHelperImpl());

    // Clean Architecture Repositories
    sl.registerLazySingleton<BluetoothRepository>(() => BluetoothRepositoryImpl());
    sl.registerLazySingleton<OBDRepository>(() => OBDRepositoryImpl());
    sl.registerLazySingleton<Elm327ProfileRepository>(() => Elm327ProfileRepositoryImpl(elm327ProfileBox));
    sl.registerLazySingleton<VehicleHealthRepository>(() => VehicleHealthRepositoryImpl(vehicleHealthBox));
    sl.registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImpl(dashboardBox));
    sl.registerLazySingleton<VehicleProfileRepository>(() => VehicleProfileRepositoryImpl(
          vehicleProfilesBox,
          vehicleSpecsBox,
          maintenanceRecordsBox,
          serviceRemindersBox,
          compatProfilesBox,
        ));
    sl.registerLazySingleton<ReportRepository>(() => ReportRepositoryImpl(
          reportsBox,
          reportTemplatesBox,
          reportExportsBox,
        ));

    // Report Generation & Export Engine Services
    sl.registerLazySingleton<ReportBuilderEngine>(() => ReportBuilderEngine());
    sl.registerLazySingleton<PDFGenerator>(() => PDFGenerator());
    sl.registerLazySingleton<HTMLGenerator>(() => HTMLGenerator());
    sl.registerLazySingleton<CSVExporter>(() => CSVExporter());
    sl.registerLazySingleton<JSONExporter>(() => JSONExporter());
    sl.registerLazySingleton<QRVerificationEngine>(() => QRVerificationEngine());
    sl.registerLazySingleton<DigitalSignatureEngine>(() => DigitalSignatureEngine());

    // Vehicle Intelligence & Maintenance Engine Services
    sl.registerLazySingleton<VinDecoderEngine>(() => VinDecoderEngine());
    sl.registerLazySingleton<VehicleSpecificationEngine>(() => VehicleSpecificationEngine());
    sl.registerLazySingleton<MaintenanceScheduler>(() => MaintenanceScheduler());
    sl.registerLazySingleton<CompatibilityEngine>(() => CompatibilityEngine());

    // Vehicle Health & Intelligence Engine Services
    sl.registerLazySingleton<HealthRuleEngine>(() => HealthRuleEngine());
    sl.registerLazySingleton<HealthScoreCalculator>(() => HealthScoreCalculator());
    sl.registerLazySingleton<TrendAnalyzer>(() => TrendAnalyzer());
    sl.registerLazySingleton<PredictiveMaintenanceEngine>(() => PredictiveMaintenanceEngine());
    sl.registerLazySingleton<ExplanationEngine>(() => ExplanationEngine());

    // Dashboard Platform Services
    sl.registerLazySingleton<LiveSessionRecorder>(() => LiveSessionRecorder());
    sl.registerLazySingleton<DashboardPerformanceMonitor>(() => DashboardPerformanceMonitor());
    sl.registerLazySingleton<DashboardController>(() => DashboardController());

    // Bluetooth Classic Transport Services
    sl.registerLazySingleton<BluetoothPermissionService>(() => BluetoothPermissionServiceImpl());
    sl.registerLazySingleton<BluetoothStateMonitor>(() => BluetoothStateMonitorImpl());
    sl.registerLazySingleton<BluetoothDiscoveryService>(() => BluetoothDiscoveryServiceImpl());
    sl.registerLazySingleton<BluetoothConnectionService>(() => BluetoothConnectionServiceImpl());
    sl.registerLazySingleton<BluetoothAutoReconnectService>(() => BluetoothAutoReconnectServiceImpl(sl()));
    sl.registerLazySingleton<BluetoothDeviceRepository>(() => BluetoothDeviceRepositoryImpl(sl()));

    // Hardware-Independent OBD Communication Abstractions
    sl.registerLazySingleton<BluetoothTransportImpl>(() => BluetoothTransportImpl(sl(), sl()));
    sl.registerLazySingleton<ObdTransport>(() => sl<BluetoothTransportImpl>());
    sl.registerLazySingleton<ResponseParser>(() => DefaultResponseParser());
    sl.registerLazySingleton<CommandExecutor>(() => DefaultCommandExecutor(sl(), sl()));
    sl.registerLazySingleton<ProtocolDetector>(() => DefaultProtocolDetector());
    sl.registerLazySingleton<ConnectionMonitor>(() => ConnectionMonitor());
    sl.registerLazySingleton<Elm327Engine>(() => Elm327Engine(sl(), sl(), sl()));

    // Firebase Auth registration with robust fallback
    FirebaseAuth? fbAuth;
    FirebaseFirestore? firestore;

    try {
      fbAuth = FirebaseAuth.instance;
      firestore = FirebaseFirestore.instance;
      sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(fbAuth!, firestore!, sl(), sl()),
      );
    } catch (e) {
      sl.registerLazySingleton<AuthRepository>(
        () => LocalAuthRepository(sl()),
      );
    }

    // Register Firestore and Storage wrappers
    final firestoreService = FirestoreService(firestore);
    sl.registerLazySingleton<FirestoreService>(() => firestoreService);
    sl.registerLazySingleton<StorageService>(() => StorageService());
    sl.registerLazySingleton<CacheManager>(() => CacheManager(sl()));

    // Clean Data Platform Repositories
    sl.registerLazySingleton<VehicleRepository>(
      () => VehicleRepositoryImpl(vehicleBox, syncQueueBox, sl(), sl()),
    );
    sl.registerLazySingleton<ScanRepository>(
      () => ScanRepositoryImpl(scanBox, syncQueueBox, sl(), sl()),
    );
    sl.registerLazySingleton<HealthRepository>(
      () => HealthRepositoryImpl(reportBox, syncQueueBox, sl(), sl()),
    );
    sl.registerLazySingleton<PidRepository>(
      () => PidRepositoryImpl(pidBox, syncQueueBox, sl(), sl()),
    );
    sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(settingsBox, syncQueueBox, sl(), sl()),
    );
    sl.registerLazySingleton<SyncRepository>(
      () => SyncRepositoryImpl(syncQueueBox, syncLogBox, conflictLogBox, sl(), sl()),
    );
  }
}

