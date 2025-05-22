import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'household_repository.dart';


Future<void> loadCurrentUserHousehold(Ref ref) async {
  final user = fb_auth.FirebaseAuth.instance.currentUser;
  if (user != null) {
    final name = await fetchHouseholdNameForUser(user.uid);
    if (name != null) {
      ref.read(householdNameProvider.notifier).setName(name);
    }
  }
}

final householdNameProvider =
AsyncNotifierProvider<HouseholdNameNotifier, String?>(() {
  return HouseholdNameNotifier();
});

class HouseholdNameNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    final user = fb_auth.FirebaseAuth.instance.currentUser;    if (user == null) return null;
    return await fetchHouseholdNameForUser(user.uid);
  }

  void setName(String name) {
    state = AsyncValue.data(name);
  }

  void clear() {
    state = const AsyncValue.data(null);
  }
}

