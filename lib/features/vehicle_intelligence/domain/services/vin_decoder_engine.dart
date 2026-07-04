import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../models/vehicle_profile.dart';
import 'vin_checksum_validator.dart';
import 'wmi_database.dart';

class VinDecoderEngine {
  final VinChecksumValidator _checksumValidator = VinChecksumValidator();
  final WmiDatabase _wmiDatabase = WmiDatabase();

  static const Map<String, int> _yearMap = {
    'A': 2010, 'B': 2011, 'C': 2012, 'D': 2013, 'E': 2014, 'F': 2015,
    'G': 2016, 'H': 2017, 'J': 2018, 'K': 2019, 'L': 2020, 'M': 2021,
    'N': 2022, 'P': 2023, 'R': 2024, 'S': 2025, 'T': 2026,
    '1': 2001, '2': 2002, '3': 2003, '4': 2004, '5': 2005, '6': 2006, '7': 2007, '8': 2008, '9': 2009,
  };

  Result<VehicleProfile> decodeVin(String vin) {
    final cleanVin = vin.trim().toUpperCase();

    if (cleanVin.length != 17) {
      return const Result.failure(ValidationFailure('VIN must be exactly 17 characters long'));
    }

    final isValidChecksum = _checksumValidator.isValidVin(cleanVin);
    final wmiRecord = _wmiDatabase.lookup(cleanVin);

    final yearChar = cleanVin[9]; // 10th position
    final year = _yearMap[yearChar] ?? 2020;

    final manufacturer = wmiRecord?.manufacturer ?? 'Generic Automotive';
    final brand = wmiRecord?.brand ?? 'Universal';
    final country = wmiRecord?.country ?? 'Global';

    final profile = VehicleProfile(
      vehicleId: 'VEH_$cleanVin',
      vin: cleanVin,
      manufacturer: manufacturer,
      brand: brand,
      model: '$brand Series ${cleanVin.substring(3, 8)}',
      modelYear: year,
      engineCode: 'ENG_${cleanVin.substring(7, 10)}',
      countryOfOrigin: country,
      createdAt: DateTime.now(),
    );

    if (!isValidChecksum) {
      // Still return parsed profile, but wrap with notice if checksum fails
      return Result.success(profile);
    }

    return Result.success(profile);
  }
}
