class Case {
  final String id;
  final String title;
  final String description;
  final String status; // 'Open', 'In Progress', 'Closed'
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String priority; // 'Low', 'Medium', 'High'

  Case({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    required this.priority,
  });

  // Create a copy of the case with modified fields
  Case copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? priority,
  }) {
    return Case(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      priority: priority ?? this.priority,
    );
  }
}
