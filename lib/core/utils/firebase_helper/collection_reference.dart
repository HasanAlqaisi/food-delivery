import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionRefHelper<T> {
  CollectionRefHelper();

  CollectionReference<T> collectoinRef({
    required FirebaseFirestore store,
    required String path,
    required T Function(
            DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
        fromFirestore,
    required Map<String, Object?> Function(T, SetOptions?) toFirestore,
  }) {
    return store
        .collection(path)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore);
  }
}
