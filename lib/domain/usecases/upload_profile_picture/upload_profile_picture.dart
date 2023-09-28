import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/upload_profile_picture/upload_profile_picture_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParams> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParams params) =>
      _userRepository.uploadProfilePicture(
        imageFile: params.filePath,
        user: params.user,
      );
}
