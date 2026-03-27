import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../repositories/ride_preference/ride_preference_repository.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;
  
  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];

  RidePreferenceState(this.repository) {
    _preferenceHistory = repository.getHistory();
    // Default to the first item in history if available
    if (_preferenceHistory.isNotEmpty) {
      _selectedPreference = _preferenceHistory.first;
    }
  }

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _preferenceHistory;

  void selectPreference(RidePreference preference) {
    if (_selectedPreference != preference) {
      _selectedPreference = preference;
      
      // Update history and repository
      repository.addPreference(preference);
      _preferenceHistory = repository.getHistory();
      
      notifyListeners();
    }
  }
}
