import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  bool _isPrivate = false;
  String _name = "Dean Winchester";
  String _email = "dean.winchester@example.com";
  double _weight = 70.0;
  double _height = 175.0;

  // Getters
  bool get isPrivate => _isPrivate;
  String get name => _name;
  String get email => _email;
  double get weight => _weight;
  double get height => _height;

  // Toggle privacy mode
  void togglePrivacy(bool value) {
    _isPrivate = value;
    notifyListeners();
  }

  // ✅ **Fix: Added updateProfileInfo Method**
  void updateProfileInfo({
    String? name,
    String? email,
    double? weight,
    double? height,
  }) {
    if (name != null) _name = name;
    if (email != null) _email = email;
    if (weight != null) _weight = weight;
    if (height != null) _height = height;
    notifyListeners();
  }

  // **Save Profile**
  void saveProfile() {
    notifyListeners();
  }
}
