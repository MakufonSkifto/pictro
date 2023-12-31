import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pictro/pages/main_pages/home_page/account_page.dart';
import 'package:pictro/utils/constants.dart';
import 'package:pictro/widgets/pictro_name.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTopBar extends StatefulWidget {
  const HomeTopBar({super.key});

  @override
  State<HomeTopBar> createState() => _HomeTopBarState();
}

class _HomeTopBarState extends State<HomeTopBar> {
  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AccountPage()
                )
              ).then((_) async {
                user.reload();
                setState(() {
                  user = FirebaseAuth.instance.currentUser!;
                });
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(99)
              ),
              child: buildPfp(),
            ),
          ),
          const SizedBox(width: 10),
          Text(user.displayName!, style: const TextStyle(
            fontSize: 20
          )),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Theme(
                data: ThemeData(dialogBackgroundColor: Colors.black),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    showAboutDialog(
                      context: context,
                      applicationLegalese: "© 2023 Emir Sürmen",
                      applicationVersion: Platform.isAndroid ? kAndroidVersion : kIOSVersion
                    );
                  },
                  child: PictroName(fontSize: 25)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPfp() {
    if (user.photoURL == null) {
      return const Padding(
        padding: EdgeInsets.all(5),
        child: Icon(CupertinoIcons.person_fill, color: Colors.white),
      );
    }

    return SizedBox(
      height: 36,
      width: 36,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.9),
        foregroundImage: CachedNetworkImageProvider(
          user.photoURL!
        ),
        radius: 17
      ),
    );
  }
}