import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // Dark background like the image
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Dynamic data for the profile
  final String userName = "Sai Srikanth Kambhampati";
  final String memberSince = "Mar, 2025";
  final int creditScore = 550;
  final String lifetimeCashback = "₹10";
  final String cashbackBalance = "₹30";
  final String coins = "10,645,678";
  final String referEarnAmount = "Rs 500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.support_agent, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/1.jpg', // Random profile image
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "member since $memberSince",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // CRED Garage Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.directions_car, color: Colors.white),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "get to know your vehicles, inside out\nCRED garage",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 16),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Credit Score Section
              _buildListTile(
                icon: Icons.show_chart,
                title: "credit score",
                subtitle: "REFRESH AVAILABLE",
                subtitleColor: Colors.green,
                trailingText: creditScore.toString(),
                onTap: () {},
              ),

              // Lifetime Cashback Section
              _buildListTile(
                icon: Icons.currency_rupee,
                title: "lifetime cashback",
                trailingText: lifetimeCashback,
                onTap: () {},
              ),

              // Bank Balance Section
              _buildListTile(
                icon: Icons.account_balance,
                title: "bank balance",
                trailingText: "check",
                onTap: () {},
              ),

              const SizedBox(height: 20),

              // Rewards & Benefits Section
              const Text(
                "YOUR REWARDS & BENEFITS",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),

              // Cashback Balance
              _buildListTile(
                title: "cashback balance",
                trailingText: cashbackBalance,
                onTap: () {},
              ),

              // Coins
              _buildListTile(
                title: "coins",
                trailingText: coins,
                onTap: () {},
              ),

              // Refer & Earn
              _buildListTile(
                title: "win upto $referEarnAmount",
                subtitle: "refer and earn",
                onTap: () {},
              ),

              const SizedBox(height: 20),

              // Transactions & Support Section
              const Text(
                "TRANSACTIONS & SUPPORT",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),

              // All Transactions
              _buildListTile(
                title: "all transactions",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build list tiles
  Widget _buildListTile({
    IconData? icon,
    required String title,
    String? subtitle,
    Color? subtitleColor,
    String? trailingText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: icon != null
          ? Icon(icon, color: Colors.white70, size: 24)
          : const SizedBox(width: 24),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: subtitleColor ?? Colors.white70,
              ),
            )
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText,
              style: const TextStyle(fontSize: 16),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
      onTap: onTap,
    );
  }
}