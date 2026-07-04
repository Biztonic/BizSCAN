import '../models/elm327_adapter_profile.dart';

abstract class Elm327ProfileRepository {
  Future<void> saveProfile(String address, Elm327AdapterProfile profile);
  Future<Elm327AdapterProfile?> getProfile(String address);
  Future<List<Elm327AdapterProfile>> getAllProfiles();
  Future<void> deleteProfile(String address);
}
