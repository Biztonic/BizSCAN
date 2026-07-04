import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/core/utils/validators.dart';

void main() {
  group('Validators Unit Tests', () {
    test('Email validator should return null for valid email', () {
      final result = Validators.validateEmail('test@example.com');
      expect(result, isNull);
    });

    test('Email validator should return error for invalid email', () {
      final result = Validators.validateEmail('invalid-email');
      expect(result, isNotNull);
    });

    test('VIN validator should return null for valid 17-char VIN', () {
      final result = Validators.validateVin('1HGCR2F83HA000000');
      expect(result, isNull);
    });

    test('VIN validator should return error for invalid VIN format', () {
      final result = Validators.validateVin('SHORT');
      expect(result, isNotNull);
    });
  });
}

