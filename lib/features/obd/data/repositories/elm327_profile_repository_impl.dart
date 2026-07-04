import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../domain/models/elm327_adapter_profile.dart';
import '../../domain/repositories/elm327_profile_repository.dart';

class Elm327ProfileRepositoryImpl implements Elm327ProfileRepository {
  final Box<String> _profileBox;

  Elm327ProfileRepositoryImpl(this._profileBox);

  @override
  Future<void> saveProfile(String address, Elm327AdapterProfile profile) async {
    await _profileBox.put(address, jsonEncode(profile.toJson()));
  }

  @override
  Future<Elm327AdapterProfile?> getProfile(String address) async {
    final raw = _profileBox.get(address);
    if (raw == null) return null;
    try {
      return Elm327AdapterProfile.fromJson(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Elm327AdapterProfile>> getAllProfiles() async {
    final list = <Elm327AdapterProfile>[];
    for (final raw in _profileBox.values) {
      try {
        list.add(Elm327AdapterProfile.fromJson(jsonDecode(raw)));
      } catch (_) {}
    }
    return list;
  }

  @override
  Future<void> deleteProfile(String address) async {
    await _profileBox.delete(address);
  }
}
