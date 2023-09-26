import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_params.dart';
import 'package:flix_id/domain/usecases/top_up/top_up_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class TopUp implements UseCase<Result<void>, TopUpParams> {
  final UserRepository _userRepository;
  final TransactionRepository _transactionRepository;

  TopUp(
      {required UserRepository userRepository,
      required TransactionRepository transactionRepository})
      : _userRepository = userRepository,
        _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParams params) async {
    CreateTransaction createTransaction =
        CreateTransaction(transactionRepository: _transactionRepository);

    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    var createTransactionResult = await createTransaction(
      CreateTransactionParams(
        transaction: Transaction(
          uid: 'flxtp-$transactionTime-${params.userId}',
          title: "Top Up",
          adminFee: 0,
          total: -params.amount,
          transactionTime: transactionTime,
        ),
      ),
    );
  }
}
