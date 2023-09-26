import 'package:flix_id/data/repositories/authentication.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetLoggedInUser implements UseCase<Result<User>, void> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  GetLoggedInUser(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void _) async {
    String? loggedID = _authentication.getLoggedInUserId();

    if (loggedID != null) {
      var userResult = await _userRepository.getUser(uid: loggedID);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.resultMessage!);
      }
    } else {
      return const Result.failed("No user logged in");
    }
  }
}
