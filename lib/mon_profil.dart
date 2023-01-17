// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/main_welcome_page/social_page.dart';
import 'package:yoga/main_welcome_page/welcome_page.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';

class MonProfil extends StatelessWidget {
  const MonProfil({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          'Mon profil',
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage('images/TotalEnergies.jpeg')),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Briand Duala',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'eric.duala@totalenergies.cm',
                style: Theme.of(context).textTheme.headline5,
              ),
              const Text(
                '666666666666666',
                style: TextStyle(color: Colors.blueAccent),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SocialPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      'Edit profil',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ListView(
                icon: LineAwesomeIcons.cog,
                onpress: () {},
                title: 'Settings',
              ),
              ListView(
                icon: Icons.dashboard_customize_outlined,
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(),
                    ),
                  );
                },
                title: 'Dashboard',
              ),
              ListView(
                icon: Icons.phone_callback,
                onpress: () {},
                title: 'contacts',
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView(
                icon: LineAwesomeIcons.info,
                onpress: () {},
                title: 'more information',
              ),
              ListView(
                icon: LineAwesomeIcons.alternate_sign_out,
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const state(),
                    ),
                  );
                },
                textColor: Colors.red,
                endicon: false,
                title: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListView extends StatelessWidget {
  const ListView({
    Key? key,
    required this.title,
    required this.icon,
    required this.onpress,
    this.endicon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onpress;
  final bool endicon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onpress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueAccent.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.blueAccent,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
        ),
        trailing: endicon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(
                  LineAwesomeIcons.angle_right,
                  size: 18.0,
                  color: Colors.grey,
                ))
            : null);
  }
}
