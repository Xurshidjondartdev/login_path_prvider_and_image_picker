import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_path_provider/pages/edit_page.dart';
import 'package:learn_path_provider/pages/registor_page.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? file;
  bool isImageSelected = false;
  bool isCamera = false;

  Future<void> getImage() async {
    isImageSelected = false;
    final ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (xFile != null) {
      file = File(xFile.path);
      final directory = await getApplicationDocumentsDirectory();
      await file!.copy("${directory.path}/image.png");
      isImageSelected = true;
      setState(() {});
    }
  }

  Future<void> read() async {
    setState(() {});
    final directory = await getApplicationDocumentsDirectory();
    await for (var event in directory.list()) {
      if (event.path.contains('image.png')) {
        isImageSelected = true;
      }
    }
    if (isImageSelected) {
      file = File("${directory.path}/image.png");
      setState(() {});
    }
  }

  @override
  void initState() {
    read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFF8D76),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {},
              ),
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_active_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: const Color(0xffFF8D76),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              minWidth: 200,
              height: 50,
              onPressed: () async {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 120,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () async {
                              isCamera = false;
                              await getImage();
                            },
                            child: const Text("Gallery"),
                          ),
                          MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () async {
                              isCamera = true;
                              await getImage();
                            },
                            child: const Text("Camera"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 90,
                backgroundColor: Colors.transparent,
                backgroundImage: profileImage(file: file),
              ),
            ),
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              height: 535,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SizedBox(
                height: 439,
                width: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 244, 240, 240),
                      child: const Text('    Mimi Headline'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 100,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Popular',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Treading',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 244, 240, 240),
                      child: const Text('    Content'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 80,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.favorite),
                              Text(
                                'Favorite                                      ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.download),
                              Text(
                                ' Popular                                        ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 244, 240, 240),
                      child: const Text('  Preferences'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 100,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.translate),
                              Text(
                                ' Language                                    ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.dark_mode),
                              Text(
                                ' Dark Mode                                  ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.wifi),
                              Text(
                                ' Only Download via Wifi             ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
