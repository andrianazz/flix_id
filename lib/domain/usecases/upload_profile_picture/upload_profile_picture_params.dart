import 'dart:io';

import 'package:flix_id/domain/entities/user.dart';

class UploadProfilePictureParams {
  final File filePath;
  final User user;

  UploadProfilePictureParams({required this.filePath, required this.user});
}
