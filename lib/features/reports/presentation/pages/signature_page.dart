import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignaturePage extends ConsumerStatefulWidget {
  const SignaturePage({super.key});

  @override
  ConsumerState<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends ConsumerState<SignaturePage> {
  final _techSigController = TextEditingController();
  final _customerSigController = TextEditingController();

  @override
  void dispose() {
    _techSigController.dispose();
    _customerSigController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Signatures'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _techSigController,
            decoration: const InputDecoration(
              labelText: 'Technician Signature / Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _customerSigController,
            decoration: const InputDecoration(
              labelText: 'Customer Signature / Acknowledgment',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.draw),
            label: const Text('Save & Sign Report'),
          ),
        ],
      ),
    );
  }
}
