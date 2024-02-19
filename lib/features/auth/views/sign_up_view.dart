import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_home/common/loading_overlay.dart';
import 'package:smart_home/common/text_style_ext.dart';
import 'package:smart_home/features/auth/widgets/widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> termsCheck = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          Text(
            "Join Smartome Today 👤",
            style: context.hm!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            "Join Smartome, Your Gateway to Smart Living.",
            style: context.tm,
          ),
          const SizedBox(height: 25),
          Text(
            "Email",
            style: context.tm!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus!.unfocus(),
            cursorColor: isDark ? Colors.grey : Colors.black54,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey.withOpacity(.1),
              hintText: "Email",
              prefixIcon: const Icon(IconlyLight.message, size: 20),
              prefixIconColor: isDark ? Colors.white : Colors.black87,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Password",
            style: context.tm!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus!.unfocus(),
            cursorColor: isDark ? Colors.grey : Colors.black54,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey.withOpacity(.1),
              hintText: "Password",
              prefixIcon: const Icon(IconlyLight.lock, size: 20),
              suffixIcon: const Icon(IconlyLight.hide, size: 20),
              prefixIconColor: isDark ? Colors.white : Colors.black87,
              suffixIconColor: isDark ? Colors.white : Colors.black87,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: termsCheck,
                builder: (context, value, child) {
                  return CupertinoCheckbox(
                    inactiveColor: isDark ? Colors.white : Colors.black87,
                    value: value,
                    onChanged: (_) {
                      termsCheck.value = !termsCheck.value;
                    },
                  );
                },
              ),
              RichTwoPartsText(
                text1: "I agree to Smartome ",
                text2: "Terms and Conditions.",
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          RichTwoPartsText(
            text1: "Already have an account? ",
            text2: "Sign In",
            onTap: () {},
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                thickness: .3,
              )),
              Text(
                "   or   ",
                style: context.tm,
              ),
              const Expanded(
                  child: Divider(
                thickness: .3,
              )),
            ],
          ),
          const SizedBox(height: 20),
          LoginButton(
            icon: Brand(Brands.google, size: 25),
            text: "Continue with Google",
            onPressed: () {},
          ),
          SizedBox(height: height * 0.02),
          LoginButton(
            icon: Icon(
              Icons.apple,
              color: isDark ? Colors.white : Colors.black,
            ),
            text: "Continue with Apple",
            onPressed: () {},
          ),
          SizedBox(height: height * 0.02),
          LoginButton(
            icon: Brand(Brands.facebook, size: 25),
            text: "Continue with Facebook",
            onPressed: () {},
          ),
          SizedBox(height: height * 0.02),
          LoginButton(
            icon: Brand(Brands.twitter, size: 25),
            text: "Continue with Twitter",
            onPressed: () {},
          ),
        ],
      ),
      // persistentFooterAlignment: AlignmentDirectional.center,

      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: .2, color: Colors.white),
          ),
        ),
        child: FilledButton(
          onPressed: () async {
            LoadingScreen.instance().show(context: context, text: "Sign Up...");
            await Future.delayed(const Duration(seconds: 1));
            LoadingScreen.instance().show(context: context, text: "20%...");
            await Future.delayed(const Duration(seconds: 1));
            LoadingScreen.instance().show(context: context, text: "40%...");
            await Future.delayed(const Duration(seconds: 1));
            LoadingScreen.instance().show(context: context, text: "60%...");
            await Future.delayed(const Duration(seconds: 1));
            LoadingScreen.instance().show(context: context, text: "80%...");
            await Future.delayed(const Duration(seconds: 1));
            LoadingScreen.instance().show(context: context, text: "100%...");
            await Future.delayed(const Duration(seconds: 1));

            LoadingScreen.instance().hide();
          },
          style: FilledButton.styleFrom(
            fixedSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}