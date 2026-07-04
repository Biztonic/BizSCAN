import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/report_repository.dart';
import '../../domain/usecases/generate_report_metadata.dart';

part 'reports_providers.g.dart';

@riverpod
ReportRepository reportRepository(ReportRepositoryRef ref) {
  return sl<ReportRepository>();
}

@riverpod
GenerateReportMetadata generateReportMetadataUseCase(GenerateReportMetadataUseCaseRef ref) {
  return GenerateReportMetadata(ref.watch(reportRepositoryProvider));
}
