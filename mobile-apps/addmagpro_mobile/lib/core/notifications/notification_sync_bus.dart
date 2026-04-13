import 'dart:async';

class NotificationSyncBus {
  NotificationSyncBus._();

  static final StreamController<Map<String, dynamic>> _controller =
      StreamController<Map<String, dynamic>>.broadcast();

  static Stream<Map<String, dynamic>> get stream => _controller.stream;

  static void emit(Map<String, dynamic> payload) {
    if (!_controller.isClosed) {
      _controller.add(payload);
    }
  }
}
