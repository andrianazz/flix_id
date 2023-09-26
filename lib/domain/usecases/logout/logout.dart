import 'package:flix_id/data/repositories/authentication.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class Logout implements UseCase<void, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<void> call(void _) {
    return _authentication.logout();
  }
}
