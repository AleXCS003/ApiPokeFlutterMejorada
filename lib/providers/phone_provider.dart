import 'package:flutter/foundation.dart';
import '../services/numverify_service.dart';
import '../models/phone_validation.dart';

class PhoneProvider with ChangeNotifier {
  final NumVerifyService _service = NumVerifyService();
  PhoneValidation? _validation;
  bool _isLoading = false;

  PhoneValidation? get validation => _validation;
  bool get isLoading => _isLoading;

  Future<void> validatePhone(String phoneNumber) async {
    _isLoading = true;
    notifyListeners();

    try {
      _validation = await _service.validatePhone(phoneNumber);
    } catch (e) {
      print('Error validating phone: $e');
      _validation = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
