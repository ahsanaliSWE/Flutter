import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new document
  Future<void> createDocument(String collectionName, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).add(data);
  }

  // Read a document by its ID
  Future<DocumentSnapshot> readDocument(String collectionName, String documentId) async {
    return await _firestore.collection(collectionName).doc(documentId).get();
  }

  // Update a document
  Future<void> updateDocument(String collectionName, String documentId, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(documentId).update(data);
  }

  // Delete a document
  Future<void> deleteDocument(String collectionName, String documentId) async {
    await _firestore.collection(collectionName).doc(documentId).delete();
  }
}
