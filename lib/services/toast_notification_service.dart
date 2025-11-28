import 'package:flutter/material.dart';

enum ToastStatus { pending, inProgress, success, error }

class ToastNotification {
  final String id;
  final String title;
  final String? message;
  final ToastStatus status;
  final double? progress;
  final DateTime createdAt;

  ToastNotification({
    required this.id,
    required this.title,
    this.message,
    required this.status,
    this.progress,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  ToastNotification copyWith({
    String? title,
    String? message,
    ToastStatus? status,
    double? progress,
  }) {
    return ToastNotification(
      id: id,
      title: title ?? this.title,
      message: message ?? this.message,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      createdAt: createdAt,
    );
  }
}

class ToastNotificationService extends ChangeNotifier {
  final List<ToastNotification> _notifications = [];
  final Map<String, DateTime> _completedToasts = {};

  List<ToastNotification> get notifications =>
      List.unmodifiable(_notifications);

  String addNotification({
    required String title,
    String? message,
    ToastStatus status = ToastStatus.pending,
    double? progress,
  }) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final notification = ToastNotification(
      id: id,
      title: title,
      message: message,
      status: status,
      progress: progress,
    );
    _notifications.add(notification);
    notifyListeners();
    return id;
  }

  void updateNotification({
    required String id,
    String? title,
    String? message,
    ToastStatus? status,
    double? progress,
  }) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(
        title: title,
        message: message,
        status: status,
        progress: progress,
      );

      // If completed (success or error), schedule removal
      if (status == ToastStatus.success || status == ToastStatus.error) {
        _completedToasts[id] = DateTime.now();
        Future.delayed(const Duration(seconds: 2), () {
          removeNotification(id);
        });
      }

      notifyListeners();
    }
  }

  void removeNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
    _completedToasts.remove(id);
    notifyListeners();
  }

  void clearAll() {
    _notifications.clear();
    _completedToasts.clear();
    notifyListeners();
  }
}
