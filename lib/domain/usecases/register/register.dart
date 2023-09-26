import 'package:flix_id/data/repositories/authentication.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/register/register_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParams> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParams params) async {
    var uidResult = await _authentication.register(
        email: params.email, password: params.password);

    if (uidResult.isSuccess) {
      var userResult = await _userRepository.createUser(
          uid: uidResult.resultValue!,
          email: params.email,
          name: params.name,
          photoUrl: params.photoUrl);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.resultMessage!);
      }
    } else {
      return Result.failed(uidResult.resultMessage!);
    }
  }
}
