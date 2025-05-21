import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

Future<void> joinHousehold(BuildContext context, String householdName) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) throw Exception("User not logged in");

  final uid = user.uid;

  final query = await FirebaseFirestore.instance
      .collection('households')
      .where('householdname', isEqualTo: householdName)
      .limit(1)
      .get();

  if (query.docs.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Household not found")),
    );
    return;
  }

  final doc = query.docs.first.reference;

  await doc.update({
    'members': FieldValue.arrayUnion([uid]),
  });

  context.go('/home');
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
