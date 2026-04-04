import 'package:flutter/foundation.dart';
import 'package:torch_light/torch_light.dart';

class MaengelLogTorchService {
  static bool _isOn = false;
  static bool get isOn => _isOn;

  static Future<void> toggle() async {
    try {
      if (_isOn) {
        await TorchLight.disableTorch();
        _isOn = false;
      } else {
        await TorchLight.enableTorch();
        _isOn = true;
      }
    } catch (e) {
      debugPrint('Torch error: $e');
      _isOn = false;
    }
  }

  static Future<void> turnOff() async {
    if (_isOn) {
      try {
        await TorchLight.disableTorch();
      } catch (e) {
        debugPrint('Torch off error: $e');
      }
      _isOn = false;
    }
  }
}
