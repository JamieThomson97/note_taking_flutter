import 'package:VeloGo/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:VeloGo/domain/auth/user.dart' as _user;

extension FirebaseUserDomainX on User {
  _user.User toDomain() {
    return _user.User(uId: UniqueId.fromUniqueString(uid));
  }
}
