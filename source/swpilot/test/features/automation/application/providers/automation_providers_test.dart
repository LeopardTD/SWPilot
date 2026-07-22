import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/providers/automation_datasource_provider.dart';
import 'package:swpilot/features/automation/application/providers/automation_repository_provider.dart';
import 'package:swpilot/features/automation/application/providers/get_active_session_provider.dart';
import 'package:swpilot/features/automation/application/providers/get_automation_result_provider.dart';
import 'package:swpilot/features/automation/application/providers/get_automation_status_provider.dart';
import 'package:swpilot/features/automation/application/providers/pause_automation_provider.dart';
import 'package:swpilot/features/automation/application/providers/resume_automation_provider.dart';
import 'package:swpilot/features/automation/application/providers/start_automation_provider.dart';
import 'package:swpilot/features/automation/application/providers/stop_automation_provider.dart';
import 'package:swpilot/features/automation/application/usecases/get_active_session_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/get_automation_result_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/get_automation_status_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/pause_automation_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/resume_automation_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/start_automation_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/stop_automation_use_case.dart';
import 'package:swpilot/features/automation/infrastructure/datasources/automation_local_datasource.dart';
import 'package:swpilot/features/automation/infrastructure/repositories/automation_repository_impl.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('Automation Dependency Injection Graph Verification', () {
    test('automationLocalDataSourceProvider resolves to AutomationLocalDataSource', () {
      final dataSource = container.read(automationLocalDataSourceProvider);
      expect(dataSource, isA<AutomationLocalDataSource>());
    });

    test('automationRepositoryProvider resolves to AutomationRepositoryImpl', () {
      final repository = container.read(automationRepositoryProvider);
      expect(repository, isA<AutomationRepositoryImpl>());
    });

    test('startAutomationUseCaseProvider resolves to StartAutomationUseCase', () {
      final useCase = container.read(startAutomationUseCaseProvider);
      expect(useCase, isA<StartAutomationUseCase>());
    });

    test('stopAutomationUseCaseProvider resolves to StopAutomationUseCase', () {
      final useCase = container.read(stopAutomationUseCaseProvider);
      expect(useCase, isA<StopAutomationUseCase>());
    });

    test('pauseAutomationUseCaseProvider resolves to PauseAutomationUseCase', () {
      final useCase = container.read(pauseAutomationUseCaseProvider);
      expect(useCase, isA<PauseAutomationUseCase>());
    });

    test('resumeAutomationUseCaseProvider resolves to ResumeAutomationUseCase', () {
      final useCase = container.read(resumeAutomationUseCaseProvider);
      expect(useCase, isA<ResumeAutomationUseCase>());
    });

    test('getAutomationStatusUseCaseProvider resolves to GetAutomationStatusUseCase', () {
      final useCase = container.read(getAutomationStatusUseCaseProvider);
      expect(useCase, isA<GetAutomationStatusUseCase>());
    });

    test('getActiveSessionUseCaseProvider resolves to GetActiveSessionUseCase', () {
      final useCase = container.read(getActiveSessionUseCaseProvider);
      expect(useCase, isA<GetActiveSessionUseCase>());
    });

    test('getAutomationResultUseCaseProvider resolves to GetAutomationResultUseCase', () {
      final useCase = container.read(getAutomationResultUseCaseProvider);
      expect(useCase, isA<GetAutomationResultUseCase>());
    });
  });
}
