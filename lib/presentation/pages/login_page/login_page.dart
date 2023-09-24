import 'package:firebase_core/firebase_core.dart';
import 'package:flix_id/data/dummy/dummy_authentication.dart';
import 'package:flix_id/data/dummy/dummy_user_repository.dart';
import 'package:flix_id/data/firebase/firebase_user_repository.dart';
import 'package:flix_id/domain/usecases/login/login.dart';
import 'package:flix_id/presentation/pages/main_page/main_page.dart';
import 'package:flix_id/presentation/providers/usecases/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/firebase/firebase_authentication.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Login login = ref.watch(loginProvider);

            login(LoginParams(
                    email: 'andrianwahyu41@gmail.com', password: '123456789'))
                .then((result) {
              if (result.isSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(user: result.resultValue!),
                    ));
              } else if (result.isFailed) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(result.resultMessage!),
                ));
              }
            });
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
