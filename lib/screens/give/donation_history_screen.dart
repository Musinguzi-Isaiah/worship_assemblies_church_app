import 'package:flutter/material.dart';
import 'donation.dart'; // Import the Donation model

class DonationHistoryScreen extends StatelessWidget {
  final List<Donation> donationHistory;

  const DonationHistoryScreen({super.key, required this.donationHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
        centerTitle: true,
      ),
      body: donationHistory.isEmpty
          ? const Center(
              child: Text(
                'No donations yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: donationHistory.length,
              itemBuilder: (context, index) {
                final donation = donationHistory[index];
                return ListTile(
                  title: Text('\$${donation.amount}'),
                  subtitle: Text('${donation.paymentMethod} - ${donation.date.toLocal()}'),
                  leading: const Icon(Icons.monetization_on, color: Colors.green),
                );
              },
            ),
    );
  }
}