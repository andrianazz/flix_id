import 'package:flix_id/domain/usecases/get_user_balance.dart/get_user_balance.dart';
import 'package:flix_id/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_balance_provider.g.dart';

@riverpod
GetUserBalance getUserBalance(GetUserBalanceRef ref) => GetUserBalance(
      userRepository: ref.watch(userRepositoryProvider),
    );
