import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class CreateTransaction
    implements UseCase<Result<void>, CreateTransactionParams> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(CreateTransactionParams params) async {
    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    final result = await _transactionRepository.createTransaction(
        transaction: params.transaction.copyWith(
            transactionTime: transactionTime,
            id: 'flx-$transactionTime-${params.transaction.uid}}'));

    return switch (result) {
      Success(value: final _) => const Result.success(null),
      Failed(:final message) => Result.failed(message)
    };
  }
}
