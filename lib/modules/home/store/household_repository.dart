import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> createHousehold(String householdName) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    throw Exception("User not logged in");
  }

  final uid = user.uid;

  await FirebaseFirestore.instance.collection('households').add({
    'householdname': householdName,
    'created_at': FieldValue.serverTimestamp(),
    'owner_id': uid,
    'members': [uid],
  });
}

Future<void> joinHouseholdIfNotAlreadyMember({
  required String userId,
  required String householdId,
}) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('households')
      .where('householdname', isEqualTo: householdId)
      .limit(1)
      .get();

  if (snapshot.docs.isEmpty) {
    throw Exception('No household found with that name.');
  }

  final doc = snapshot.docs.first;

  await FirebaseFirestore.instance
      .collection('households')
      .doc(doc.id)
      .update({
    'members': FieldValue.arrayUnion([userId]),
  });
}

Future<String?> fetchHouseholdNameForUser(String uid) async {
  final result = await FirebaseFirestore.instance
      .collection('households')
      .where('members', arrayContains: uid)
      .limit(1)
      .get();

  if (result.docs.isEmpty) return null;
  return result.docs.first['householdname'] as String;
}