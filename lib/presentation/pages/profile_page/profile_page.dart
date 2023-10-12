import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/profile_page/methods/update_profile.dart';
import 'package:flix_id/presentation/pages/profile_page/methods/user_info.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                verticalSpace(20),
                ...userInfo(ref),
                verticalSpace(20),
                const Divider(),
                verticalSpace(20),
                profileItem("Update Profile"),
                verticalSpace(20),
                profileItem("My Wallet"),
                verticalSpace(20),
                profileItem("Change Password"),
                verticalSpace(20),
                profileItem("Change Languange"),
                verticalSpace(20),
                const Divider(),
                verticalSpace(20),
                profileItem("Contact Us"),
                verticalSpace(20),
                profileItem("Privacy Policy"),
                verticalSpace(20),
                profileItem("Term and Condition"),
                verticalSpace(60),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(userDataProvider.notifier).logout();
                    },
                    child: const Text("Logout"),
                  ),
                ),
                verticalSpace(10),
                const Text(
                  "version 0.0.1",
                  style: TextStyle(fontSize: 12),
                ),
                verticalSpace(100),
              ],
            ),
          )
        ],
      ),
    );
  }
}
