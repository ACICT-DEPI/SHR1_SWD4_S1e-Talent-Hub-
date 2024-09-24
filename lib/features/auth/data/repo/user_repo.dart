import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talent_hub/features/auth/data/models/user_model.dart';

class UserRepoImpl extends UserRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  CollectionReference<UserModel> getUsersCollection() {
    return _firestore.collection('users').withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  @override
  Future<void> addUserToFirestore(UserModel user) {
    return getUsersCollection().doc(user.id).set(user);
  }

  @override
  Future<UserModel> readUserFromFirestore(String uid) async {
    var documentSnapshot = await getUsersCollection().doc(uid).get();
    return documentSnapshot.data()!;
  }
}

abstract class UserRepo {
  CollectionReference<UserModel> getUsersCollection();
  Future<void> addUserToFirestore(UserModel user);
  Future<UserModel> readUserFromFirestore(String uid);
}