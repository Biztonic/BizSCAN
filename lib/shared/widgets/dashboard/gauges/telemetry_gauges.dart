import 'package:flutter/material.dart';
import 'circular_gauge.dart';
import 'digital_gauge.dart';

class BatteryGauge extends StatelessWidget {
  final double voltage;
  const BatteryGauge({super.key, required this.voltage});

  @override
  Widget build(BuildContext context) {
    return CircularGauge(
      value: voltage,
      minValue: 8,
      maxValue: 16,
      label: 'Battery Voltage',
      unit: 'V',
      warningThreshold: 11.8,
      criticalThreshold: 10.5,
    );
  }
}

class RPMGauge extends StatelessWidget {
  final double rpm;
  const RPMGauge({super.key, required this.rpm});

  @override
  Widget build(BuildContext context) {
    return CircularGauge(
      value: rpm,
      minValue: 0,
      maxValue: 8000,
      label: 'Engine RPM',
      unit: 'RPM',
      warningThreshold: 5500,
      criticalThreshold: 6500,
    );
  }
}

class SpeedGauge extends StatelessWidget {
  final double speed;
  const SpeedGauge({super.key, required this.speed});

  @override
  Widget build(BuildContext context) {
    return DigitalGauge(
      value: speed,
      label: 'Vehicle Speed',
      unit: 'km/h',
      warningThreshold: 120,
      criticalThreshold: 160,
    );
  }
}

class CoolantGauge extends StatelessWidget {
  final double temp;
  const CoolantGauge({super.key, required this.temp});

  @override
  Widget build(BuildContext context) {
    return CircularGauge(
      value: temp,
      minValue: 0,
      maxValue: 130,
      label: 'Coolant Temp',
      unit: '°C',
      warningThreshold: 100,
      criticalThreshold: 110,
    );
  }
}

class FuelGauge extends StatelessWidget {
  final double trim;
  const FuelGauge({super.key, required this.trim});

  @override
  Widget build(BuildContext context) {
    return DigitalGauge(
      value: trim,
      label: 'Fuel Trim',
      unit: '%',
      warningThreshold: 15,
      criticalThreshold: 25,
    );
  }
}
