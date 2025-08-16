// import 'package:web_app/core/utils/secure_storage.dart';
// import '../../features/auth/data/repositories/refresh/refresh_respository_impl.dart';
// import 'package:dartz/dartz.dart';
// import 'package:web_app/features/auth/data/models/refresh/refresh_model.dart';
// import '../networks/failures.dart';
//
// class RefreshTokenHelper {
//   final RefreshRepositoryImpl repository;
//
//   RefreshTokenHelper(this.repository);
//
//   Future<bool> refreshToken() async {
//     try {
//       final refreshToken = await SecureStorage.getRefresh();
//       if (refreshToken == null) return false;
//
//       final Either<Failure, RefreshModel> result =
//       await repository.refresh(refreshToken);
//
//       return result.fold(
//             (failure) {
//           print("Refresh token failed: $failure");
//           return false;
//         },
//             (refreshModel) async {
//           await SecureStorage.saveToken(refreshModel.access_token);
//           if (refreshModel.access_token != null) {
//             await SecureStorage.saveRefresh(refreshModel.access_token);
//           }
//           print("Refresh token Successed");
//           return true;
//         },
//       );
//     } catch (e) {
//       print("Error refreshing token: $e");
//       return false;
//     }
//   }
// }
