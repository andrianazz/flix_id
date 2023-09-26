import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transactions_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetTransactions
    implements UseCase<Result<List<Transaction>>, GetTransactionParams> {
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionParams params) async {
    final transactionListResult =
        await _transactionRepository.getUserTransactions(uid: params.uid);

    return switch (transactionListResult) {
      Success(value: final transactionsList) =>
        Result.success(transactionsList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
