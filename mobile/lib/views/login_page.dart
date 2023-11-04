import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome!",
              style: GoogleFonts.montserrat().copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4CAF50),
              ),
            ),
            const SizedBox(
              height: 82,
            ),
            TextField(
              style: GoogleFonts.montserrat().copyWith(
                color: const Color(0xFF323941),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4CAF50),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4CAF50),
                  ),
                ),
                labelText: "Email/Phone number",
                labelStyle: GoogleFonts.montserrat().copyWith(
                  color: const Color(0xFF323941),
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              style: GoogleFonts.montserrat().copyWith(
                color: const Color(0xFF323941),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4CAF50),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4CAF50),
                  ),
                ),
                labelText: "Password",
                labelStyle: GoogleFonts.montserrat().copyWith(
                  color: const Color(0xFF323941),
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 22,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                  ),
                  child: Text(
                    "Forgot your password?",
                    style: GoogleFonts.montserrat().copyWith(
                      color: const Color(0xFF545454),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 88,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  backgroundColor: const Color(0xFF4CAF50),
                  padding: const EdgeInsets.all(17),
                ),
                child: Text(
                  "Log in",
                  style: GoogleFonts.montserrat().copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 22,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "Create an account",
                  style: GoogleFonts.montserrat().copyWith(
                    color: const Color(0xFF333333),
                    fontSize: 16,
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
