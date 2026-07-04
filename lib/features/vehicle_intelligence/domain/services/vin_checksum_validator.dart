class VinChecksumValidator {
  static const Map<String, int> _charValues = {
    'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5, 'F': 6, 'G': 7, 'H': 8,
    'J': 1, 'K': 2, 'L': 3, 'M': 4, 'N': 5, 'P': 7, 'R': 9,
    'S': 2, 'T': 3, 'U': 4, 'V': 5, 'W': 6, 'X': 7, 'Y': 8, 'Z': 9,
    '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
  };

  static const List<int> _weights = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2];

  bool isValidVin(String vin) {
    final cleanVin = vin.trim().toUpperCase();
    if (cleanVin.length != 17) return false;

    // Reject invalid characters I, O, Q
    if (cleanVin.contains(RegExp(r'[IOQ]'))) return false;

    int sum = 0;
    for (int i = 0; i < 17; i++) {
      final char = cleanVin[i];
      final val = _charValues[char];
      if (val == null) return false;
      sum += val * _weights[i];
    }

    final remainder = sum % 11;
    final expectedCheckChar = remainder == 10 ? 'X' : remainder.toString();
    final actualCheckChar = cleanVin[8]; // 9th position (0-indexed 8)

    return expectedCheckChar == actualCheckChar;
  }
}
