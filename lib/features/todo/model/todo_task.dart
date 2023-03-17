// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoTask {
  final int id;
  final String task;
  final DateTime addedAt;
  final DateTime? completedAt;
  TodoTask({
    required this.id,
    required this.task,
    required this.addedAt,
    this.completedAt,
  });

  TodoTask copyWith({
    int? id,
    String? task,
    DateTime? addedAt,
    DateTime? completedAt,
  }) {
    return TodoTask(
      id: id ?? this.id,
      task: task ?? this.task,
      addedAt: addedAt ?? this.addedAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'task': task,
      'addedAt': addedAt.millisecondsSinceEpoch,
      'completedAt': completedAt?.millisecondsSinceEpoch,
    };
  }

  factory TodoTask.fromMap(Map<String, dynamic> map) {
    return TodoTask(
      id: map['id'] as int,
      task: map['task'] as String,
      addedAt: DateTime.fromMillisecondsSinceEpoch(map['addedAt'] as int),
      completedAt: map['completedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['completedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoTask.fromJson(String source) =>
      TodoTask.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoTask(id: $id, task: $task, addedAt: $addedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(covariant TodoTask other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.task == task &&
        other.addedAt == addedAt &&
        other.completedAt == completedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        task.hashCode ^
        addedAt.hashCode ^
        completedAt.hashCode;
  }
}
