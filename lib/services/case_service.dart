import 'package:uuid/uuid.dart';
import '../models/case_model.dart';

class CaseService {
  static final CaseService _instance = CaseService._internal();
  
  late List<Case> _cases;

  factory CaseService() {
    return _instance;
  }

  CaseService._internal() {
    _initializeSampleData();
  }

  void _initializeSampleData() {
    _cases = [
      Case(
        id: const Uuid().v4(),
        title: 'Client Onboarding',
        description: 'Complete onboarding process for new client',
        status: 'In Progress',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        priority: 'High',
      ),
      Case(
        id: const Uuid().v4(),
        title: 'Bug Fix: Login Page',
        description: 'Fix authentication issue on login page',
        status: 'Open',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        priority: 'High',
      ),
      Case(
        id: const Uuid().v4(),
        title: 'Documentation Update',
        description: 'Update API documentation',
        status: 'Open',
        createdAt: DateTime.now(),
        priority: 'Low',
      ),
    ];
  }

  // Get all cases
  List<Case> getAllCases() {
    return _cases;
  }

  // Get case by ID
  Case? getCaseById(String id) {
    try {
      return _cases.firstWhere((case_) => case_.id == id);
    } catch (e) {
      return null;
    }
  }

  // Add new case
  Case addCase({
    required String title,
    required String description,
    required String priority,
  }) {
    final newCase = Case(
      id: const Uuid().v4(),
      title: title,
      description: description,
      status: 'Open',
      createdAt: DateTime.now(),
      priority: priority,
    );
    _cases.add(newCase);
    return newCase;
  }

  // Update case
  bool updateCase(String id, {
    String? title,
    String? description,
    String? status,
    String? priority,
  }) {
    final index = _cases.indexWhere((case_) => case_.id == id);
    if (index == -1) return false;

    _cases[index] = _cases[index].copyWith(
      title: title,
      description: description,
      status: status,
      priority: priority,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  // Delete case
  bool deleteCase(String id) {
    final index = _cases.indexWhere((case_) => case_.id == id);
    if (index == -1) return false;
    _cases.removeAt(index);
    return true;
  }

  // Get cases by status
  List<Case> getCasesByStatus(String status) {
    return _cases.where((case_) => case_.status == status).toList();
  }
}
