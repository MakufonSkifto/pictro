import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:pictro/pages/register/register.dart';
import 'package:pictro/utils/constants.dart';
import 'package:pictro/widgets/custom_button.dart';
import 'package:pictro/widgets/pictro_name.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black87
        ),
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: FadeTransition(
            opacity: animation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: PictroName()
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  child: Text(
                    "Connect with loved ones through art, without leaving your home screen.",
                    style: TextStyle(fontFamily: geologicaMedium, fontSize: 20, color: Colors.white.withOpacity(.9)),
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Get.to(() => Register());
                  },
                  text: "Get started",
                  backgroundColor: Colors.purple.shade500
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
