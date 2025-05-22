import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mealix/helper/colors_darktheme_option.dart';
import '/modules/home/store/household_provider.dart';
import '/modules/home/store/household_repository.dart';
import '/modules/home/widgets/create_household_form.dart';
import '/modules/home/widgets/join_household_form.dart';
import '/modules/authentication/enum/tab_mode_enum.dart';
import '/modules/authentication/widget/wave_clipper_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

final tabModeProvider = StateProvider<TabMode>((ref) => TabMode.tab1);

Future<DocumentSnapshot?> getUserHouseholdDocument(String userId) async {
  final result = await FirebaseFirestore.instance
      .collection('households')
      .where('members', arrayContains: userId)
      .limit(1)
      .get();

  return result.docs.isNotEmpty ? result.docs.first : null;
}

class HouseholdManagerPage extends ConsumerWidget {
  const HouseholdManagerPage({super.key});

  static String get routeLocation => '/household';
  static String get routeName => 'household';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final mode = ref.watch(tabModeProvider);
    final imageWidth = size.width * 0.78;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height + 100,
          child: Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: size.height * 0.3,
                  color: theme.colorScheme.secondary,
                ),
              ),

              // Title
              Positioned(
                top: size.height * 0.09,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.householdTitle,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: ThemeColors.themedBlack(context),
                    ),
                  ),
                ),
              ),

              // Image
              Positioned(
                top: size.height * 0.17,
                left: 0,
                right: 0,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/household.png',
                      width: imageWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Form container or leave screen
              Positioned(
                top: size.height * 0.55,
                left: size.width * 0.1,
                right: size.width * 0.1,
                child: FutureBuilder(
                  future: getUserHouseholdDocument(FirebaseAuth.instance.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final doc = snapshot.data;
                    if (doc != null) {
                      final householdName = doc['householdname'] ?? 'Unnamed Household';
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Household name: $householdName', style: theme.textTheme.titleLarge),
                            const SizedBox(height: 16),

                            ElevatedButton.icon(
                              icon: const Icon(Icons.logout, color: Colors.white),
                              label: const Text('Leave Household', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () async {
                                final user = FirebaseAuth.instance.currentUser;
                                if (user != null) {
                                  await FirebaseFirestore.instance
                                      .collection('households')
                                      .doc(doc.id)
                                      .update({
                                    'members': FieldValue.arrayRemove([user.uid]),
                                  });

                                  ref.invalidate(householdNameProvider);
                                  context.go(HouseholdManagerPage.routeLocation);
                                }
                              },
                            ),

                            const SizedBox(height: 12),

                            // 👇 Back button
                            TextButton.icon(
                              icon: const Icon(Icons.arrow_back),
                              label: const Text('Back to Home'),
                              onPressed: () => context.go('/home'),
                              style: TextButton.styleFrom(
                                foregroundColor: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        )
                      );
                    }

                    // Original form UI if no household
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Tab bar
                          Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => ref.read(tabModeProvider.notifier).state = TabMode.tab1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: mode == TabMode.tab1
                                            ? theme.colorScheme.secondary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!.tabCreateHousehold,
                                          style: theme.textTheme.labelLarge?.copyWith(
                                            color: mode == TabMode.tab1
                                                ? theme.colorScheme.primary
                                                : theme.colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => ref.read(tabModeProvider.notifier).state = TabMode.tab2,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: mode == TabMode.tab2
                                            ? theme.colorScheme.secondary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!.tabJoinHousehold,
                                          style: theme.textTheme.labelLarge?.copyWith(
                                            color: mode == TabMode.tab2
                                                ? theme.colorScheme.primary
                                                : theme.colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          mode == TabMode.tab1
                              ? const CreateHouseholdForm()
                              : const JoinHouseholdForm(),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => context.go('/home'),
                                style: TextButton.styleFrom(
                                  foregroundColor: theme.colorScheme.onSurfaceVariant,
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  textStyle: theme.textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                child: Text(AppLocalizations.of(context)!.cancelButtonText),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (mode == TabMode.tab1) {
                                    final householdNameAsync = ref.watch(householdNameProvider);
                                    final name = householdNameAsync.value;
                                    if (name != null && name.isNotEmpty) {
                                      await createHousehold(name);
                                      ref.read(householdNameProvider.notifier).setName(name);
                                      context.go('/home');
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(AppLocalizations.of(context)!.createHouseholdEmptyError),
                                        ),
                                      );
                                    }
                                  } else {
                                    final joinName = JoinHouseholdFormState.getEnteredName()?.trim();
                                    if (joinName != null && joinName.isNotEmpty) {
                                      final user = FirebaseAuth.instance.currentUser;
                                      if (user == null) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('User not logged in.')),
                                        );
                                        return;
                                      }

                                      try {
                                        await joinHouseholdIfNotAlreadyMember(
                                          userId: user.uid,
                                          householdId: joinName,
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(e.toString())),
                                        );
                                        return;
                                      }
                                      ref.read(householdNameProvider.notifier).setName(joinName);
                                      context.go('/home');
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(AppLocalizations.of(context)!.joinHouseholdEmptyError),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.secondary,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(16),
                                ),
                                child: Icon(Icons.arrow_forward, color: theme.colorScheme.primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}