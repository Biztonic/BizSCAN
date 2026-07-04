class WmiRecord {
  final String wmi;
  final String manufacturer;
  final String brand;
  final String country;

  const WmiRecord({
    required this.wmi,
    required this.manufacturer,
    required this.brand,
    required this.country,
  });
}

class WmiDatabase {
  static const Map<String, WmiRecord> _wmiMap = {
    '1HG': WmiRecord(wmi: '1HG', manufacturer: 'Honda Motor Co.', brand: 'Honda', country: 'United States'),
    '1FA': WmiRecord(wmi: '1FA', manufacturer: 'Ford Motor Company', brand: 'Ford', country: 'United States'),
    '1G1': WmiRecord(wmi: '1G1', manufacturer: 'General Motors', brand: 'Chevrolet', country: 'United States'),
    '2T1': WmiRecord(wmi: '2T1', manufacturer: 'Toyota Canada', brand: 'Toyota', country: 'Canada'),
    '3VW': WmiRecord(wmi: '3VW', manufacturer: 'Volkswagen de Mexico', brand: 'Volkswagen', country: 'Mexico'),
    'JN1': WmiRecord(wmi: 'JN1', manufacturer: 'Nissan Motor Co.', brand: 'Nissan', country: 'Japan'),
    'JHM': WmiRecord(wmi: 'JHM', manufacturer: 'Honda Motor Co.', brand: 'Honda', country: 'Japan'),
    'JT2': WmiRecord(wmi: 'JT2', manufacturer: 'Toyota Motor Corp', brand: 'Toyota', country: 'Japan'),
    'KMH': WmiRecord(wmi: 'KMH', manufacturer: 'Hyundai Motor Co.', brand: 'Hyundai', country: 'South Korea'),
    'KNM': WmiRecord(wmi: 'KNM', manufacturer: 'Renault Samsung / Kia', brand: 'Kia', country: 'South Korea'),
    'MA3': WmiRecord(wmi: 'MA3', manufacturer: 'Maruti Suzuki India', brand: 'Maruti Suzuki', country: 'India'),
    'MBH': WmiRecord(wmi: 'MBH', manufacturer: 'Nissan Motor India', brand: 'Nissan', country: 'India'),
    'ME4': WmiRecord(wmi: 'ME4', manufacturer: 'Mahindra & Mahindra', brand: 'Mahindra', country: 'India'),
    'MAT': WmiRecord(wmi: 'MAT', manufacturer: 'Tata Motors', brand: 'Tata Motors', country: 'India'),
    'WBA': WmiRecord(wmi: 'WBA', manufacturer: 'BMW AG', brand: 'BMW', country: 'Germany'),
    'WDD': WmiRecord(wmi: 'WDD', manufacturer: 'Mercedes-Benz AG', brand: 'Mercedes-Benz', country: 'Germany'),
    'WVW': WmiRecord(wmi: 'WVW', manufacturer: 'Volkswagen AG', brand: 'Volkswagen', country: 'Germany'),
  };

  WmiRecord? lookup(String vin) {
    if (vin.length < 3) return null;
    final wmi = vin.substring(0, 3).toUpperCase();
    return _wmiMap[wmi];
  }
}
