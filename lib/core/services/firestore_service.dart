import 'package:cloud_firestore/cloud_firestore.dart';
import '../errors/failures.dart';
import '../errors/result.dart';

class FirestoreService {
  final FirebaseFirestore? _firestore;

  FirestoreService(this._firestore);

  Future<Result<void>> setDocument(String collection, String docId, Map<String, dynamic> data) async {
    final fs = _firestore;
    if (fs == null) {
      return const Result.failure(ServerFailure('Firestore not configured (Offline fallback)'));
    }
    try {
      await fs.collection(collection).doc(docId).set(data);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Firestore write failed: ${e.toString()}'));
    }
  }

  Future<Result<Map<String, dynamic>?>> getDocument(String collection, String docId) async {
    final fs = _firestore;
    if (fs == null) {
      return const Result.failure(ServerFailure('Firestore not configured (Offline fallback)'));
    }
    try {
      final doc = await fs.collection(collection).doc(docId).get();
      if (doc.exists) {
        return Result.success(doc.data());
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Firestore read failed: ${e.toString()}'));
    }
  }

  Future<Result<void>> deleteDocument(String collection, String docId) async {
    final fs = _firestore;
    if (fs == null) {
      return const Result.failure(ServerFailure('Firestore not configured (Offline fallback)'));
    }
    try {
      await fs.collection(collection).doc(docId).delete();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Firestore delete failed: ${e.toString()}'));
    }
  }

  Future<Result<List<Map<String, dynamic>>>> getCollection(String collection) async {
    final fs = _firestore;
    if (fs == null) {
      return const Result.failure(ServerFailure('Firestore not configured (Offline fallback)'));
    }
    try {
      final snapshot = await fs.collection(collection).get();
      final docs = snapshot.docs.map((doc) => doc.data()).toList();
      return Result.success(docs);
    } catch (e) {
      return Result.failure(ServerFailure('Firestore collection fetch failed: ${e.toString()}'));
    }
  }

  Stream<List<Map<String, dynamic>>> watchCollection(String collection) {
    final fs = _firestore;
    if (fs == null) {
      return Stream.value([]);
    }
    return fs.collection(collection).snapshots().map(
      (snap) => snap.docs.map((doc) => doc.data()).toList(),
    );
  }
}
