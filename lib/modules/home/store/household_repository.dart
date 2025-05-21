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
  final firestore = FirebaseFirestore.instance;

  // Check if user is already a member of ANY household
  final existing = await firestore
      .collection('households')
      .where('members', arrayContains: userId)
      .get();

  if (existing.docs.isNotEmpty) {
    throw Exception('You’re already part of a household.');
  }

  // Add to new household
  await firestore.collection('households').doc(householdId).update({
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