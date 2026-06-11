import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const RegisterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  void dispose() {
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void handleSignUp() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  InputDecoration buildInputDecoration(String label, String hint,
      {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text(
              'Register',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Form(
              key: formKey,
              child: Column(
                children: [
                  // Mobile Number Field
                  TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: buildInputDecoration(
                      'Enter your mobile number',
                      '1712345678',
                      suffixIcon: const Icon(Icons.check_circle),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile number is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Email Field
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: buildInputDecoration(
                      'Enter your email',
                      'abc12@gmail.com',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    decoration: buildInputDecoration(
                      'Enter your password',
                      '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() => showPassword = !showPassword);
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password Field
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: !showConfirmPassword,
                    decoration: buildInputDecoration(
                      'Re-Enter your password',
                      '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          showConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(
                              () => showConfirmPassword = !showConfirmPassword);
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 28),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: handleSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Sign In Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Navigate to Sign In')),
                    );
                  },
                  child: const Text('Sign in',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Divider
            Row(
              children: [
                Expanded(child: Container(height: 1, color: Colors.grey[300])),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('or'),
                ),
                Expanded(child: Container(height: 1, color: Colors.grey[300])),
              ],
            ),
            const SizedBox(height: 20),

            // Google Button
            buildSocialButton('Continue with Google', Icons.language),
            const SizedBox(height: 12),

            // Apple Button
            buildSocialButton('Continue with Apple', Icons.apple),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildSocialButton(String text, IconData icon) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$text tapped')),
          );
        },
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(text),
          ],
        ),
      ),
    );
  }
}
