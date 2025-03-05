import 'dart:async';
import 'package:get/get.dart';

class TimeController extends GetxController {
  final time = 600.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time.value--;
      } else {
        timer.cancel(); 
      }
    });
  }

  String showTime() {
    int minutes = time.value ~/ 60; 
    int seconds = time.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'; // Format as MM:SS
  }

  @override
  void onClose() {
    _timer?.cancel(); 
    super.onClose();
  }
}
