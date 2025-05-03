import 'package:flutter/material.dart';
import 'package:mealix/modules/authentication/components/wave_clipper_component.dart';
import 'package:mealix/shared/components/two_tab_bar_component.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthenticationPage();
  }
}

class _AuthenticationPage extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Wave-shaped green background
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: size.height * 0.4,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Positioned(
              top: size.height * 0.2 - 35,
              left: size.width * 0.5 - 90,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 90,
                backgroundImage: AssetImage('assets/images/login_food.png'),
              ),
            ),
            Positioned(
              top: size.height * 0.38,
              left: size.width * 0.1,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  width: size.width * 0.8,
                  height: size.height - size.height * 0.38 - 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      TwoTabBar(
                        tab1Title: 'Login',
                        tab2Title: 'Sign Up',
                        tab1Content: Column(
                          children: [
                            const SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'E-Mail',
                                prefixIcon: const Icon(Icons.email_outlined),
                                filled: true,
                                fillColor: const Color(0xFF0D1026),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Passwort',
                                prefixIcon: const Icon(Icons.key_outlined),
                                filled: true,
                                fillColor: const Color(0xFF0D1026),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                        tab2Content: Column(
                          children: [
                            const SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'E-Mail',
                                prefixIcon: const Icon(Icons.email_outlined),
                                filled: true,
                                fillColor: const Color(0xFF0D1026),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Passwort',
                                prefixIcon: const Icon(Icons.key_outlined),
                                filled: true,
                                fillColor: const Color(0xFF0D1026),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*

// Circle Image
         
          // Login Form
          Positioned.fill(
            top: size.height * 0.38,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Tab bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3FF2B),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D1026),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Registrieren',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'E-Mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: const Color(0xFF0D1026),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password Field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Passwort',
                      prefixIcon: const Icon(Icons.key_outlined),
                      filled: true,
                      fillColor: const Color(0xFF0D1026),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Login Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE3FF2B),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
          */